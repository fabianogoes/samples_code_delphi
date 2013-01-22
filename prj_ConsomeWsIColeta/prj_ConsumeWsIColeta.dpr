program prj_ConsumeWsIColeta;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {Form1},
  IColetaService in 'IColetaService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
