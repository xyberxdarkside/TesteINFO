program CadastroDeClientes;

uses
  Vcl.Forms,
  uCadCli in 'uCadCli.pas' {fCadClientes},
  uDmDados in 'uDmDados.pas' {DmDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfCadClientes, fCadClientes);
  Application.CreateForm(TDmDados, DmDados);
  Application.Run;
end.
