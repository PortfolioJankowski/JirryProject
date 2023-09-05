program Jirry;

uses
  Vcl.Forms,
  DBConnectionForm in 'DBConnectionForm.pas' {DataModule2: TDataModule},
  Manage in 'Manage.pas' {ManagingForm: TForm1);


{$R *.res},
  Vcl.Themes,
  Vcl.Styles,
  Login in 'Login.pas' {SigningForm},
  AdminPanel in 'AdminPanel.pas' {Admin},
  UserPanel in 'UserPanel.pas' {User},
  GlobalVariables in 'GlobalVariables.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;


  Application.CreateForm(TSigningForm, SigningForm);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TManagingForm, ManagingForm);
  Application.CreateForm(TAdmin, Admin);
  Application.CreateForm(TUser, User);
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.Run;
end.

