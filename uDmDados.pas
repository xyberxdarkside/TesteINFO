unit uDmDados;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Types,
  System.JSON, IniFiles, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdMessage,
  IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdAttachmentFile,
  IdText;

Const
 cUrlViaCEP = 'https://viacep.com.br/ws/%s/json/';

Type
 TAddressData = Record
  cep,
  logradouro,
  complemento,
  bairro,
  localidade,
  uf          : String;
End;

type
  TDmDados = class(TDataModule)
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
   Function ConsultaCEP(Cep             : String;
                        Var ReturnValue : TAddressData) : Boolean;
   Function Sendmail   (Const AAssunto,
                        ADestino,
                        AAnexo          : String;
                        ACorpo          : TStrings)     : Boolean;
  end;

 Function CleanTrash(Value : String) : String;

var
  DmDados: TDmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Function TDmDados.Sendmail(Const AAssunto,
                           ADestino,
                           AAnexo          : String;
                           ACorpo          : TStrings) : Boolean;
Var
 IniFile              : TIniFile;
 sFrom,
 sBccList,
 sHost,
 sUserName,
 sPassword            : String;
 iPort                : Integer;
 idMsg                : TIdMessage;
 IdText               : TIdText;
 idSMTP               : TIdSMTP;
 IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
Begin
 Try
  Try
   IniFile                                := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
   sFrom                                  := IniFile.ReadString ('Email', 'From',     sFrom);
   sHost                                  := IniFile.ReadString ('Email', 'Host',     sHost);
   iPort                                  := IniFile.ReadInteger('Email', 'Port',     iPort);
   sUserName                              := IniFile.ReadString ('Email', 'UserName', sUserName);
   sPassword                              := IniFile.ReadString ('Email', 'Password', sPassword);
   IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
   IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
   IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;
   idMsg                            := TIdMessage.Create(Self);
   idMsg.CharSet                    := 'utf-8';
   idMsg.Encoding                   := meMIME;
   idMsg.From.Address               := sFrom;
   idMsg.Priority                   := mpNormal;
   idMsg.Subject                    := AAssunto;
   idMsg.Recipients.Add;
   idMsg.Recipients.EMailAddresses := ADestino;
   idText := TIdText.Create(idMsg.MessageParts);
   idText.Body.Add(ACorpo.Text);
   idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';
   IdSMTP                           := TIdSMTP.Create(Self);
   IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
   IdSMTP.UseTLS                    := utUseImplicitTLS;
   IdSMTP.AuthType                  := satDefault;
   IdSMTP.Host                      := sHost;
   IdSMTP.AuthType                  := satDefault;
   IdSMTP.Port                      := iPort;
   IdSMTP.Username                  := sUserName;
   IdSMTP.Password                  := sPassword;
   IdSMTP.Connect;
   IdSMTP.Authenticate;
   If AAnexo <> EmptyStr Then
    If FileExists(AAnexo) Then
     TIdAttachmentFile.Create(idMsg.MessageParts, AAnexo);
   If IdSMTP.Connected Then
    Begin
     Try
      IdSMTP.Send(idMsg);
     Except
      On E : Exception Do
       Begin
        Result := False;
       End;
     End;
    End;
   If IdSMTP.Connected Then
    IdSMTP.Disconnect;
   Result := True;
  Finally
   IniFile.Free;
   UnLoadOpenSSLLibrary;
   FreeAndNil(idMsg);
   FreeAndNil(IdSSLIOHandlerSocket);
   FreeAndNil(idSMTP);
  End;
 Except
  On E : Exception Do
   Begin
    Result := False;
   End;
 End;
End;

Function CleanTrash(Value : String) : String;
Begin
 Result := StringReplace(StringReplace(Value, '.', '', [rfReplaceAll]),
                                              '-', '', [rfReplaceAll]);
End;

Function TDmDados.ConsultaCEP(Cep             : String;
                              Var ReturnValue : TAddressData) : Boolean;
 Procedure ReplyValue(Value : String);
 Var
  JSONValue : TJSonValue;
 Begin
  JSONValue := TJSONObject.ParseJSONValue(Value);
  Try
   ReturnValue.cep         := JsonValue.GetValue<string>('cep');
   ReturnValue.logradouro  := JsonValue.GetValue<string>('logradouro');
   ReturnValue.complemento := JsonValue.GetValue<string>('complemento');
   ReturnValue.bairro      := JsonValue.GetValue<string>('bairro');
   ReturnValue.localidade  := JsonValue.GetValue<string>('localidade');
   ReturnValue.uf          := JsonValue.GetValue<string>('uf');
  Finally
   FreeAndNil(JSONValue);
  End;
 End;
Begin
 Result := False;
 Try
  RESTClient1.BaseURL := Format(cUrlViaCEP, [CleanTrash(Cep)]);
  RESTRequest1.Method := TRESTRequestMethod.rmGET;
  RESTRequest1.Execute;
 Finally
  Result := RESTRequest1.Response.StatusCode = 200;
  If Result Then
   Begin
    Result := Not (Pos('"erro":', Lowercase(RESTRequest1.Response.Content)) > 0);
    If Result Then
     ReplyValue(RESTRequest1.Response.Content);
   End;
 End;
End;

end.
