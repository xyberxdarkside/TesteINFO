unit uCadCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Xml.XMLDoc, Xml.XMLIntf;

Const
 cRegs    = 'Registro %d de %d';
 cAssunto = 'Cadastro de Teste da INFO';

type
  TfCadClientes = class(TForm)
    pMenu: TPanel;
    sbPost: TSpeedButton;
    SbInsert: TSpeedButton;
    sbEdit: TSpeedButton;
    sbCancel: TSpeedButton;
    sbDelete: TSpeedButton;
    DBNPrincipal: TDBNavigator;
    mmPrincipal: TMainMenu;
    Aes1: TMenuItem;
    Inserir1: TMenuItem;
    Editar1: TMenuItem;
    N1: TMenuItem;
    Confirmar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Excluir1: TMenuItem;
    N3: TMenuItem;
    Sair1: TMenuItem;
    PCPrincipal: TPageControl;
    tsCadastro: TTabSheet;
    tsModo: TTabSheet;
    DBGPrincipal: TDBGrid;
    sbPrincipal: TStatusBar;
    fdCadastro: TFDMemTable;
    dsCadastro: TDataSource;
    fdCadastroCodigo: TIntegerField;
    fdCadastroNome: TStringField;
    fdCadastroCPF: TStringField;
    fdCadastroTelefone: TStringField;
    fdCadastroEmail: TStringField;
    fdCadastroCep: TStringField;
    fdCadastroLogradouro: TStringField;
    fdCadastroNumero: TStringField;
    fdCadastroComplemento: TStringField;
    fdCadastroBairro: TStringField;
    fdCadastroCidade: TStringField;
    fdCadastroEstado: TStringField;
    fdCadastroPais: TStringField;
    gbDadosCad: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBENome: TDBEdit;
    fdCadastroDataCadastro: TDateTimeField;
    DBTCodigo: TDBText;
    Label3: TLabel;
    DBTDataCadastro: TDBText;
    Label4: TLabel;
    DBECPF: TDBEdit;
    Label5: TLabel;
    DBETelefone: TDBEdit;
    Label6: TLabel;
    DBEEmail: TDBEdit;
    gbEndereco: TGroupBox;
    Label7: TLabel;
    DBECep: TDBEdit;
    Label8: TLabel;
    DBELogradouro: TDBEdit;
    Label9: TLabel;
    DBENumero: TDBEdit;
    Label10: TLabel;
    DBEComplemento: TDBEdit;
    Label11: TLabel;
    DBEBairro: TDBEdit;
    Label12: TLabel;
    DBECidade: TDBEdit;
    Label13: TLabel;
    DBCBUf: TDBComboBox;
    fdCadastroXML: TBlobField;
    Label14: TLabel;
    DBEPais: TDBEdit;
    sbFindCep: TSpeedButton;
    procedure PCPrincipalChange(Sender: TObject);
    procedure PCPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure fdCadastroAfterInsert(DataSet: TDataSet);
    procedure DBECPFExit(Sender: TObject);
    procedure SbInsertClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbPostClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure fdCadastroAfterOpen(DataSet: TDataSet);
    procedure DBEEmailExit(Sender: TObject);
    procedure sbFindCepClick(Sender: TObject);
    procedure DBECepExit(Sender: TObject);
  private
    { Private declarations }
   Procedure ChangeItemsState(DataSet : TDataset);
   Procedure TestControls    (Parent  : TWinControl;
                              Enabled : Boolean);
   Function  isCPF           (Value   : String) : Boolean;
  public
    { Public declarations }
  end;

 Procedure ExpXML(DataSet     : TDataSet;
                  Var Stream  : TStream);

var
 FCadClientes : TFCadClientes;

implementation

{$R *.dfm}

Uses uDmDados;

Function ValidarEMail(Value : String) : Boolean;
Begin
 Value := Trim(UpperCase(Value));
 Result := Pos('@', Value) > 1;
 If Result Then
  Begin
   Delete(Value, 1, Pos('@', Value));
   Result := (Length(Value) > 0) and (Pos('.', Value) > 2);
  End;
End;

Procedure ExpXML(DataSet     : TDataSet;
                 Var Stream  : TStream);
Var
 I     : Integer;
 xml   : TXMLDocument;
 reg,
 campo : IXMLNode;
Begin
 Stream := TMemoryStream.Create;
 xml    := TXMLDocument.Create(nil);
 Try
  xml.Active := True;
  DataSet.First;
  xml.DocumentElement := xml.CreateElement('Dados', '');
  DataSet.First;
  While Not DataSet.Eof Do
   Begin
    reg := xml.DocumentElement.AddChild('row');
    For i := 0 to DataSet.Fields.Count - 1 do
     Begin
      If DataSet.Fields[i].DisplayLabel <> 'XML' Then
       Begin
        campo := reg.AddChild(DataSet.Fields[i].DisplayLabel);
        campo.Text := DataSet.Fields[i].DisplayText;
       End;
     End;
    DataSet.Next;
   End;
  xml.SaveToStream(Stream);
  Stream.Position := 0;
 Finally
  xml.free;
 End;
end;

Function TFCadClientes.isCPF(Value : String) : Boolean;
Var
 CPF,
 dig10,
 dig11   : String;
 s, i,
 r, peso : Integer;
Begin
 isCPF := false;
 CPF := CleanTrash(Value);
 If ((CPF = '00000000000') or (CPF = '11111111111') or
     (CPF = '22222222222') or (CPF = '33333333333') or
     (CPF = '44444444444') or (CPF = '55555555555') or
     (CPF = '66666666666') or (CPF = '77777777777') or
     (CPF = '88888888888') or (CPF = '99999999999') or
     (length(CPF) <> 11)) Then
  Exit;
 Try
  s := 0;
  peso := 10;
  For i := 1 To 9 Do
   Begin
    s := s + (StrToInt(CPF[i]) * peso);
    peso := peso - 1;
   End;
  r := 11 - (s mod 11);
  If ((r = 10) Or (r = 11)) Then
   dig10 := '0'
  Else
   str(r:1, dig10);
  s := 0;
  peso := 11;
  For i := 1 To 10 Do
   Begin
    s := s + (StrToInt(CPF[i]) * peso);
    peso := peso - 1;
   End;
  r := 11 - (s mod 11);
  If ((r = 10) or (r = 11)) Then
   dig11 := '0'
  Else str(r:1, dig11);
  isCPF := ((dig10 = CPF[10]) and (dig11 = CPF[11]));
 Except
 End;
End;

Procedure TFCadClientes.TestControls(Parent: TWinControl; Enabled : Boolean);
Var
 i   : Integer;
 Ctl : TControl;
Begin
 For i := 0 to Pred(Parent.ControlCount) do
  Begin
   Ctl         := Parent.Controls[i];
   If Not(Ctl is TPageControl) Then
    Begin
     Ctl.Enabled := Enabled;
     If (Ctl is TWinControl) then
      TestControls(TWinControl(Ctl), Enabled);
    End;
  End;
End;

Procedure TFCadClientes.ChangeItemsState(DataSet : TDataset);
Var
 vEditInsert,
 vActive     : Boolean;
Begin
 vEditInsert                         := DataSet.State in [dsEdit, dsInsert];
 vActive                             := Not(DataSet.State in [dsInactive]);
 PCPrincipal.Pages[1].Enabled        := vActive And (Not vEditInsert);
 Inserir1.Enabled                    := (Not (vEditInsert));
 SbInsert.Enabled                    := Inserir1.Enabled;
 Editar1.Enabled                     := (Not (vEditInsert)) And vActive And (Dataset.RecordCount > 0);
 sbEdit.Enabled                      := Editar1.Enabled;
 Confirmar1.Enabled                  := (vEditInsert) And vActive;
 sbPost.Enabled                      := Confirmar1.Enabled;
 Cancelar1.Enabled                   := sbPost.Enabled;
 sbCancel.Enabled                    := Cancelar1.Enabled;
 Excluir1.Enabled                    := sbEdit.Enabled;
 sbDelete.Enabled                    := Excluir1.Enabled;
 Sair1.Enabled                       := Excluir1.Enabled Or Not(vActive);
 DBNPrincipal.Enabled                := vActive And (DataSet.State in [dsBrowse]);
 If Excluir1.Enabled Then
  Excluir1.Enabled            := Dataset.RecordCount > 0;
 If vActive Then
  sbPrincipal.SimpleText := Format(cRegs, [Dataset.RecNo, Dataset.RecordCount])
 Else
  sbPrincipal.SimpleText := Format(cRegs, [0, 0]);
 TestControls(tsCadastro, (DataSet.State in [dsEdit, dsInsert]) And vActive);   //Desabilita/Habilita os Controles em seus momentos necessários
End;

procedure TfCadClientes.DBECepExit(Sender: TObject);
begin
 If trim(DBECep.Text) <> '' Then
  sbFindCep.onClick(sbFindCep);
end;

procedure TfCadClientes.DBECPFExit(Sender: TObject);
begin
 If fdCadastro.State in [dsEdit, dsInsert] Then
  Begin
   If Not isCPF(CleanTrash(DBECPF.Text)) Then
    Begin
     If Trim(DBECPF.Text) <> '' Then
      Begin
       Application.MessageBox('Cpf Inválido...', 'Erro...', Mb_IconError + mb_Ok);
       DBECPF.SetFocus;
      End;
    End;
  End;
end;

procedure TfCadClientes.DBEEmailExit(Sender: TObject);
begin
 If fdCadastro.State in [dsEdit, dsInsert] Then
  Begin
   If Not ValidarEMail(DBEEmail.Text) Then
    Begin
     If Trim(DBEEmail.Text) <> '' Then
      Begin
       Application.MessageBox('E-Mail Inválido...', 'Erro...', Mb_IconError + mb_Ok);
       DBEEmail.SetFocus;
      End
     Else
      DBECep.SetFocus;
    End
   Else
    DBECep.SetFocus;
  End
 Else
  DBECep.SetFocus;
end;

procedure TfCadClientes.fdCadastroAfterInsert(DataSet: TDataSet);
begin
 fdCadastroCodigo.AsInteger        := fdCadastro.RecordCount + 1;
 fdCadastroDataCadastro.AsDateTime := Now;
 ChangeItemsState(Dataset);
end;

procedure TfCadClientes.fdCadastroAfterOpen(DataSet: TDataSet);
begin
 ChangeItemsState(Dataset);
end;

procedure TfCadClientes.FormCreate(Sender: TObject);
begin
 ChangeItemsState(fdCadastro);
end;

procedure TFCadClientes.PCPrincipalChange(Sender: TObject);
begin
 If PCPrincipal.ActivePage = tsCadastro Then
  Self.WindowState        := tWindowState.wsNormal
 Else
  Self.WindowState        := tWindowState.wsMaximized;
end;

procedure TFCadClientes.PCPrincipalChanging(Sender: TObject; var AllowChange: Boolean);
begin
 AllowChange := Not fdCadastro.Active;
 If Not AllowChange Then
  AllowChange := Not(fdCadastro.State in [dsEdit, dsInsert]);
end;

procedure TfCadClientes.sbCancelClick(Sender: TObject);
begin
 fdCadastro.Cancel;
end;

procedure TfCadClientes.sbDeleteClick(Sender: TObject);
begin
 PCPrincipal.ActivePage := tsCadastro;
 PCPrincipal.OnChange(Self);
 If MessageBox(0, 'Você deseja realmente excluir o Registro Atual ?', 'Pergunta ???',
               Mb_IconQuestion + mb_YesNo) = mrYes then
  fdCadastro.Delete;
end;

procedure TfCadClientes.sbEditClick(Sender: TObject);
begin
 PCPrincipal.ActivePage := tsCadastro;
 PCPrincipal.OnChange(Self);
 fdCadastro.Edit;
 DBENome.SetFocus;
end;

procedure TfCadClientes.sbFindCepClick(Sender: TObject);
Var
 ReturnValue : TAddressData;
begin
 If Not DmDados.ConsultaCEP(DBECep.Text, ReturnValue) Then
  Application.MessageBox('Cep Inválido...', 'Erro...', Mb_IconError + mb_Ok)
 Else
  Begin
   fdCadastroLogradouro.AsString  := ReturnValue.logradouro;
   fdCadastroComplemento.AsString := ReturnValue.complemento;
   fdCadastroBairro.AsString      := ReturnValue.bairro;
   fdCadastroCidade.AsString      := ReturnValue.localidade;
   fdCadastroEstado.AsString      := ReturnValue.uf;
  End;
end;

procedure TfCadClientes.SbInsertClick(Sender: TObject);
begin
 PCPrincipal.ActivePage := tsCadastro;
 PCPrincipal.OnChange(Self);
 If Not fdCadastro.Active Then
  fdCadastro.Open;
 fdCadastro.Insert;
 DBENome.SetFocus;
end;

procedure TfCadClientes.sbPostClick(Sender: TObject);
Var
 vStream   : TStream;
 vTempMem  : TFDMemtable;
 aFile     : String;
 vBodyMail : TStringList;
 Procedure BuildBody;
 Var
  I : Integer;
 Begin
  vBodyMail := TStringList.Create;
  vBodyMail.Add('Dados Cadastrais.');
  vBodyMail.Add('');
  For I := 2 To fdCadastro.Fields.Count -2 Do
   vBodyMail.Add(Format('%s : %s', [fdCadastro.Fields[I].DisplayLabel,
                                    fdCadastro.Fields[I].DisplayText]));
 End;
begin
 vBodyMail := Nil;
 If fdCadastro.State In [dsinsert, dsedit] Then
  Begin
   If Trim(DBEEmail.Text) = '' Then
    Begin
     Application.MessageBox('E-Mail Obrigatório...', 'Erro...', Mb_IconError + mb_Ok);
     DBEEmail.SetFocus;
    End
   Else
    Begin
     fdCadastro.Post;
     vTempMem      := TFDMemtable.Create(Nil);
     vTempMem.Data := fdCadastro.Data;
     ExpXML(vTempMem, vStream);
     Try
      fdCadastro.Edit;
      fdCadastroXML.LoadFromStream(vStream);
      fdCadastro.Post;
      vStream.Position := 0;
      aFile := ExtractFilePath(ParamStr(0)) + 'temp.xml';
      TMemoryStream(vStream).SaveToFile(aFile);
      BuildBody;
      If Not DmDados.Sendmail(cAssunto,
                              fdCadastroEmail.AsString,
                              aFile,
                              vBodyMail) Then
       Application.MessageBox('Erro no envio, verifique o Endereço se está correto ou a Internet connectada...', 'Erro...', Mb_IconError + mb_Ok);
     Finally
      FreeAndNil(vStream);
      FreeAndNil(vTempMem);
      If Assigned(vBodyMail) Then
       FreeAndNil(vBodyMail);
      DeleteFile(aFile);
     End;
    End;
  End
 Else
  fdCadastro.Cancel;
end;

end.
