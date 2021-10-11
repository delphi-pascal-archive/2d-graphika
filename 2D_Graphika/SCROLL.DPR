program scroll;

uses
  Forms,
  scroll_ in 'scroll_.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Литература';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
