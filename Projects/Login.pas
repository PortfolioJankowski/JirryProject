unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DBConnectionForm, Data.DB,
  Data.Win.ADODB, AdminPanel , UserPanel, GlobalVariables	;

type
  TSigningForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    logInBtn: TButton;
    logQuery: TADOQuery;
    procedure logInBtnClick(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }


  public
    user_ver : String;
  end;

var
  SigningForm: TSigningForm;

implementation

{$R *.dfm}

procedure TSigningForm.Edit2Change(Sender: TObject);
begin
  logInBtn.Enabled  := (Edit1.Text <> '') and (Edit2.Text <> '')
end;





procedure TSigningForm.FormCreate(Sender: TObject);
begin
  SigningForm.Position := poScreenCenter;
end;

procedure TSigningForm.logInBtnClick(Sender: TObject);
// If someone presses Log in then I check the data entered against the data in the database (Users table)

 // Declaration of variables
  var

    u_mail: string;
    u_password: string;
    result: string;

begin
// Assigning to variables the text entered at login
      u_mail := Edit1.Text;
      u_password := Edit2.Text;

      //assigning email to a global variable - this is needed to identify on other forms the logger
      globalEmail	:= u_mail;



// Determine the parameters used in the query
      logQuery.Parameters.ParamByName('u_mail').Value := u_mail;
      logQuery.Parameters.ParamByName('u_password').Value := u_password;

// Assigning to TADOQuery on Form a query that will check email and password
      logQuery.SQL.Text := 'SELECT type FROM users WHERE email = :u_mail AND password = :u_password';


{Start the query and verify the results -> if it found anything then we move on to verifying
 Who the user is. If the user has type U then the User form will open, and if the user
 has type A then admin form will open}
      logQuery.Open;
      if not logQuery.IsEmpty then
      begin
         //verify user -> Is this an Administrator or a user?
         result := logQuery.FieldByName('type').AsString;
         if result = 'A' then
            begin
              SigningForm.Hide;
              Admin.ShowModal;


            end
            else
            begin
               SigningForm.Hide;
               User.ShowModal;
            end;

      end
      else
      begin
        ShowMessage('Invalid email address or password')
      end;


end;

end.
