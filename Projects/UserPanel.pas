unit UserPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.Win.ADODB, GlobalVariables, DBConnectionForm, Vcl.DBCtrls,
  Vcl.ExtCtrls	;

type
  TUser = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    helloLBL: TLabel;
    deadlineTaskQuery: TADOQuery;
    userProjectsQRY: TADOQuery;
    userTasksQRY: TADOQuery;
    updateTaskQRY: TADOQuery;
    Label2: TLabel;
    completeTaskBTN: TButton;
    userPSRC: TDataSource;
    userTSRC: TDataSource;
    completeTaskQRY: TADOQuery;
    tasksCMB: TDBComboBox;
    Label3: TLabel;
    autoUpdateProjectsQRY: TADOQuery;
    taskShowQRY: TADOQuery;
    procedure FormActivate(Sender: TObject);
    procedure completeTaskBTNClick(Sender: TObject);
    procedure updateTaskBTNClick(Sender: TObject);
    procedure addBugBTNClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  User: TUser;
  deadlineT: string;

implementation

{$R *.dfm}




procedure TUser.FormActivate(Sender: TObject);
begin

    {at form startup, I enable the greeting label and refresh queries after assigning a
     a global variable to them so that the appropriate records appear on the grids - for a particular User}
    helloLBL.Caption := 'Hello! ' + globalEmail;
    userProjectsQRY.Parameters.ParamByName('globalEMail').Value := globalEmail;
    userTasksQRY.Parameters.ParamByName('globalEMail').Value := globalEmail;
    autoUpdateProjectsQRY.Parameters.ParamByName('globalEmail').Value := globalEmail;

     //refresh grids
    userTasksQRY.Requery();
    userProjectsQRY.Requery();


    //display tasks that have a deadline today or earlier
        deadlineTaskQuery.Open;
        deadlineT := '';
        while not deadlineTaskQuery.Eof	 do
          begin
            deadlineT :=  deadlineT + deadlineTaskQuery.FieldByName('description').AsString  + #13#10;
            deadlineTaskQuery.Next;
          end;
        deadlineTaskQuery.Close;
        if deadlineT <> '' then
          begin
            ShowMessage('Projects that end today and earlier: ' + #13#10 + deadlineT)
          end
          else
          begin
            ShowMessage('No projects to complete today')
          end;

      // add tasks to comboboxes until there is no EOF
        taskShowQRY.Parameters.ParamByName('globalEmail').Value := globalEmail;
        taskShowQRY.Open;
        while not taskShowQRY.Eof do
           begin
              tasksCMB.Items.Add(taskShowQRY.FieldByName('description').AsString);
              taskShowQRY.Next;
              tasksCMB.Refresh;
           end;
         taskShowQRY.Close;




end;

procedure TUser.updateTaskBTNClick(Sender: TObject);
begin
  //query is started, which changes the status of the shuffle to 'in progress'.
  updateTaskQRY.Parameters.ParamByName('taskDesc').Value := tasksCMB.Text;
  updateTaskQRY.ExecSQL;

  userTasksQRY.Requery()
end;



procedure TUser.addBugBTNClick(Sender: TObject);
// defines variables that will take values from the user form
var
  project_name, project_desc, u_email :string;
  start_date, end_date: TDateTime;
  user_id: Integer;
begin

end;

procedure TUser.completeTaskBTNClick(Sender: TObject);
begin
    // runs a query that changes the status of the shuffle to 'completed'
    completeTaskQRY.Parameters.ParamByName('taskDesc').Value := tasksCMB.Text;
    completeTaskQRY.ExecSQL;

    //refresh grids
    userTasksQRY.Requery();
    userProjectsQRY.Requery();

    //refresh the list in the combobox
    tasksCMB.Items.Clear;

    // add tasks to combobox until there is no EOF
        taskShowQRY.Parameters.ParamByName('globalEmail').Value := globalEmail;
        taskShowQRY.Open;
        while not taskShowQRY.Eof do
           begin
              tasksCMB.Items.Add(taskShowQRY.FieldByName('description').AsString);
              taskShowQRY.Next;
              tasksCMB.Refresh;
           end;
         taskShowQRY.Close;

      {after changing the status of a task, I enable a query that checks to see if there are any more Tasks at the project
       that are specified as 'to do'. If there are not, it updates the status of that project as 'completed'}
        autoUpdateProjectsQRY.ExecSQL;
end;


end.
