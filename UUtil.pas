unit UUtil;

interface

uses System.SysUtils, System.StrUtils, fmx.listbox, System.Classes, DateUtils, IdAttachmentFile, IdIOHandler,
     IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,FMX.dialogs,
     IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
     IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText,DBAccess,FMX.Memo,
     IdHashMessageDigest, Math;

     function MandarMail(Remetente, Destinatario, Assunto: String; Texto: TMemo):boolean;


implementation

function MandarMail(Remetente, Destinatario, Assunto: String; Texto: TMemo):boolean;
var
  email      : TIdMessage;
  idSMTPGMail: TIdSMTP;
  idSSLGMail : TIdSSLIOHandlerSocketOpenSSL;
begin
  idSSLGMail                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  idSSLGMail.SSLOptions.Method := sslvTLSv1;
  idSSLGMail.SSLOptions.Mode   := sslmUnassigned;

  idSMTPGMail                  := TIdSMTP.Create(nil);
  idSMTPGMail.IOHandler        := idSSLGMail;
  idSMTPGMail.UseTLS           := utUseExplicitTLS;

  email                           := TIdMessage.Create(nil);
  email.From.Address              := remetente;
  email.From.Text                 := 'informatica@ielb.org.br';
  email.From.User                 := 'Restinga Serviços';
  email.Recipients.EMailAddresses := Destinatario;
  email.Subject                   := Assunto;
  email.Body.Text                 := Texto.Text;

  idSMTPGMail.Host     := 'smtp.gmail.com';
  idSMTPGMail.Port     := 587;
  idSMTPGMail.UserName := 'informatica@ielb.org.br';
  idSMTPGMail.Password := 'Ielb1904';


  try
    idSMTPGMail.Connect;
    try
      if Length(Destinatario) > 0 then
        idSMTPGMail.Send(email);
      result := true;
    Except on E : Exception do
    Begin
      result := false;
    End;
    end;
  finally
    idSMTPGMail.Disconnect;
  end;

  email.Free;
  idSSLGMail.Free;
  idSMTPGMail.Free;
  Beep;
end;
end.
