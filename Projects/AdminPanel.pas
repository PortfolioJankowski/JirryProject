unit AdminPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, DBConnectionForm, Vcl.DBCtrls, Data.Win.ADODB, Manage,
  Vcl.WinXPickers, Vcl.ExtCtrls		;

type
  TAdmin = class(TForm)
    Label1: TLabel;
    leadCMBQRY: TADOQuery;
    leadCMBQRYemail: TStringField;
    leaderCMB: TDBComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Label5: TLabel;
    Label6: TLabel;
    projectsGRD: TDBGrid;
    Label8: TLabel;
    Label9: TLabel;
    pNameEDT: TEdit;
    PDescEDT: TEdit;
    startDate: TDatePicker;
    endDate: TDatePicker;
    insertProjectQRY: TADOQuery;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ProjectBTN: TButton;
    taskGrid: TDBGrid;
    Label10: TLabel;
    Label15: TLabel;
    GroupBox1: TGroupBox;
    projectCMBQRY: TADOQuery;
    projectCMB: TDBComboBox;
    taskdescEDT: TEdit;
    tStartDate: TDatePicker;
    tEndDate: TDatePicker;
    Button2: TButton;
    ProjectToIDQRY: TADOQuery;
    EmailToIDQry: TADOQuery;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    pfinishedCMB: TDBComboBox;
    tfinishedCMB: TDBComboBox;
    Button3: TButton;
    Button4: TButton;
    pfinishedQRY: TADOQuery;
    tfinishedQRY: TADOQuery;
    holderCMB: TDBComboBox;
    deleteProjectQRY: TADOQuery;
    deleteTaskQRY: TADOQuery;
    projectDeadlineQRY: TADOQuery;
    GroupBox3: TGroupBox;
    DBComboBox1: TDBComboBox;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProjectBTNClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure pfinishedCMBChange(Sender: TObject);
    procedure tfinishedCMBChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Admin: TAdmin;

implementation

{$R *.dfm}

// When running the form, it adds records from SQL Query to COMBOBOX.
// The administrator will be able to select the email, the user he will assign to the project
procedure TAdmin.Button1Click(Sender: TObject);
begin
    ManagingForm.ShowModal;
end;

// Add Task Button
procedure TAdmin.Button2Click(Sender: TObject);
var
  project_name, task_desc, ue_email, status :string;
  start_date, end_date: TDateTime;
  user_id, project_id: Integer;
begin
  //checking that the fields have been filled in correctly
  if (Length(projectCMB.Text)=0) or (Length(holderCMB.Text) =0) or (taskdescEDT.Text	='')  or (tstartDate.Date	> tendDate.Date)		 then
     begin
        ShowMessage('Please fill the fields correctly')
     end
     else

     //fields filled in correctly
     begin
        ue_email := holderCMB.Text;

        // based on the email, I look in the Users table for the user ID for the Projects table
       EmailToIDQry.Parameters.ParamByName('u_email').Value := ue_email;
       EmailToIDQry	.SQL.Text := 'SELECT id FROM users WHERE email = :u_email';
       EmailToIDQry.Open;
        // assigning the result of the query as inta to the user_id
       user_id := EmailToIDQry.FieldByName('id').AsInteger;

       EmailToIDQry.Close;

      // same for project_name and project_id
       project_name := projectCMB.Text;

       ProjectToIDQRY.Parameters.ParamByName('project_name').Value := project_name;
       ProjectToIDQRY.SQL.Text := 'SELECT id FROM projects WHERE project_name = :project_name';
       ProjectToIDQRY.Open;
       project_id := ProjectToIDQRY.FieldByName('id').AsInteger;
       ProjectToIDQRY.Close;

       //assigning values from the form to variables that I will throw into the databaseh
       task_desc := taskdescEDT.Text;
       start_date := tStartDate.Date;
       end_date := tEndDate.Date;
       status := 'to do';


       DBConnectionForm.DataModule2.TasksTbl	.Insert;
       DBConnectionForm.DataModule2.TasksTbl['user_id'] := user_id;
       DBConnectionForm.DataModule2.TasksTbl['project_id'] := project_id;
       DBConnectionForm.DataModule2.TasksTbl['description'] := task_desc;
       DBConnectionForm.DataModule2.TasksTbl['start_date'] := start_date;
       DBConnectionForm.DataModule2.TasksTbl['end_date'] := end_date ;
       DBConnectionForm.DataModule2.TasksTbl['status'] := status;
       DBConnectionForm.DataModule2.TasksTbl.Post;

       // refreshing the query returning data to GRID to include the new record
       DBConnectionForm.DataModule2.TasksQRY.Requery();



       taskdescEDT.Text := '';
       holderCMB.Text := '';
       projectCMB.Text := '';

       // message about adding a record to the DB
       ShowMessage('Task has been added')
     end;
end;

procedure TAdmin.Button3Click(Sender: TObject);
begin
    if Length(pfinishedCMB.Text	) = 0  then
            begin
              ShowMessage('Choose project to delete')
            end
            else
            begin
              deleteProjectQRY.Parameters.ParamByName('project_name').Value := pfinishedCMB.Text;
              deleteProjectQRY.ExecSQL;
              ShowMessage('Project has been deleted.');

              //refresh query to refresh grid with Tasks
              DBConnectionForm.DataModule2.ProjectsQRY	.Requery();

              pfinishedCMB.Items.Clear;
             //adding completed projects to combobox
              pfinishedQRY.Open;
              // add projects to combobox until there is no EOF
              while not pfinishedQRY.Eof do
                 begin
                    pfinishedCMB.Items.Add(pfinishedQRY.FieldByName('project_name').AsString);
                    pfinishedQRY.Next;
                    pfinishedCMB.Refresh;
                 end;

              //release resources
              pfinishedQRY.Close;

              projectCMB.Items.Clear;
              projectCMBQRY.Open;
              projectCMB.text := '';
              /// add projects to combobox until there is no EOF
               while not projectCMBQRY.Eof do
               begin
                  projectCMB.Items.Add(projectCMBQRY.FieldByName('project_name').AsString);
                  projectCMBQRY.Next;
                  projectCMB.Refresh;
               end;

              //release resources
               projectCMBQRY.Close;

            end;
end;

//Delete Task Button
procedure TAdmin.Button4Click(Sender: TObject);
begin
          if Length(tfinishedCMB.Text)=0  then
            begin
              ShowMessage('Choose task to delete')
            end
            else
            begin
              deleteTaskQRY.Parameters.ParamByName('description').Value := tfinishedCMB.Text;
              deleteTaskQRY.ExecSQL;
              ShowMessage('Task has been deleted.');

              //refresh query to refresh grid with Tasks
              DBConnectionForm.DataModule2.TasksQRY.Requery();

              tfinishedCMB.Items.Clear;
              //adding completed shuffles to combobox
              tfinishedQRY.Open;

              // adding projects to combobox until there is no EOF
               while not tfinishedQRY.Eof do
                 begin
                    tfinishedCMB.Items.Add(tfinishedQRY.FieldByName('description').AsString);
                    tfinishedQRY.Next;
                    tfinishedCMB.Refresh;
                 end;

               //release resources
              tfinishedQRY.Close;
            end;
end;

// when opening a form add to comboboxes on a list form
procedure TAdmin.FormActivate(Sender: TObject);
var
deadlineP: string;
begin
     leadCMBQRY.Open;
     leaderCMB.Text := '';
     holderCMB.Text := '';
     startDate.Date := Now;
     endDate.Date := Now;
     tStartDate.Date := Now;
     tEndDate.Date := Now;
     pfinishedCMB.Items.Clear;

     //adding emails to comboboxes with emails until query is not EndOfFile
     while not leadCMBQRY.Eof do
        begin
         leaderCMB.Items.Add(leadCMBQRY.FieldByName('email').AsString);
         holderCMB.Items.Add(leadCMBQRY.FieldByName('email').AsString);
         leadCMBQRY.Next;

        end;

        //refresh comboboxes (text should appear in them - list)
        leaderCMB	.Refresh;
        holderCMB.Refresh;


        //release resources
        leadCMBQRY.Close;

         projectCMB.Items.Clear;
         projectCMBQRY.Open;
         projectCMB.text := '';
        // add projects to combobox until there is no EOF
        while not projectCMBQRY.Eof do
           begin
              projectCMB.Items.Add(projectCMBQRY.FieldByName('project_name').AsString);
              projectCMBQRY.Next;
              projectCMB.Refresh;
           end;

        //release resources
        projectCMBQRY.Close;


        //adding completed projects to combobox
        pfinishedQRY.Open;
        // add projects to combobox until there is no EOF
        while not pfinishedQRY.Eof do
           begin
              pfinishedCMB.Items.Add(pfinishedQRY.FieldByName('project_name').AsString);
              pfinishedQRY.Next;
              pfinishedCMB.Refresh;
           end;

          //release resources
        pfinishedQRY.Close;


        //adding completed shuffles to combobox
        tfinishedQRY.Open;
        // add projects to combobox until there is no EOF
        while not tfinishedQRY.Eof do
           begin
              tfinishedCMB.Items.Add(tfinishedQRY.FieldByName('description').AsString);
              tfinishedQRY.Next;
              tfinishedCMB.Refresh;
           end;

        //release resources
        tfinishedQRY.Close;


        //display projects that have a deadline today or earlier
        projectDeadlineQRY.Open;
        deadlineP := '';
        while not projectDeadlineQRY.Eof	 do
          begin
            deadlinep :=  deadlineP + projectDeadlineQRY.FieldByName('project_name').AsString  + #13#10;
            projectDeadlineQRY.Next;
          end;
        projectDeadlineQRY.Close;
        if deadlineP <> '' then
          begin
            ShowMessage('Projects that end today and earlier: ' + #13#10 + deadlineP)
          end
          else
          begin
            ShowMessage('No projects to complete today')
          end;

end;

procedure TAdmin.FormCreate(Sender: TObject);
begin
  Admin.Position := poScreenCenter;
end;




procedure TAdmin.pfinishedCMBChange(Sender: TObject);
begin
  Button3.Enabled := pfinishedCMB.Text <> '';
end;

procedure TAdmin.ProjectBTNClick(Sender: TObject);
// defines variables that will take values from the user form
var
  project_name, project_desc, u_email :string;
  start_date, end_date: TDateTime;
  user_id: Integer;

begin
    //check if the fields have been completed, and if they have, assign their values to variables
  if (Length(pNameEDT.Text)= 0) or (Length(PDescEDT.Text)=0) or (startDate.Date	> endDate.Date) then
    begin
      ShowMessage('Please fill the fields correctly')
    end
  else
    begin
       u_email := leaderCMB.Text;
      // based on the email, I look in the Users table for the user ID for the Projects table
       insertProjectQRY.Parameters.ParamByName('u_email').Value := u_email;
       insertProjectQRY	.SQL.Text := 'SELECT id FROM users WHERE email = :u_email';
       insertProjectQRY.Open;
        // assigns the result of the query as inta to the user_id
       user_id := insertProjectQRY.FieldByName('id').AsInteger;
       insertProjectQRY.Close;
       // further assignment of variables
       project_name := pNameEDT.Text;
       start_date := startDate.Date;
       end_date := endDate.Date;
       project_desc := PDescEDT.Text;

       // the assigned variables will form a record in the Projects table
       DBConnectionForm.DataModule2.ProjectsTbl.Insert;
       DBConnectionForm.DataModule2.ProjectsTbl['user_id'] := user_id;
       DBConnectionForm.DataModule2.ProjectsTbl['project_name'] := project_name;
       DBConnectionForm.DataModule2.ProjectsTbl['description'] := project_desc;
       DBConnectionForm.DataModule2.ProjectsTbl['start_date'] := start_date;
       DBConnectionForm.DataModule2.ProjectsTbl['end_date'] := end_date ;
       DBConnectionForm.DataModule2.ProjectsTbl['status'] := 'to do';
       DBConnectionForm.DataModule2.ProjectsTbl.Post;

       // I refresh the query returning data to GRID to include the new record
       DBConnectionForm.DataModule2.ProjectsQRY.Requery()	   ;



       pNameEDT.Text := '';
       PDescEDT.Text := '';
       leaderCMB.Text := '';
      // message about adding a record to the datab
       ShowMessage('Project has been added');

       // I refresh the Combobox with the projects in the Add Task section.
       projectCMB.Items.Clear;
          projectCMBQRY.Open;
         projectCMB.text := '';
        /// add projects to combobox until there is no EOF
        while not projectCMBQRY.Eof do
           begin
              projectCMB.Items.Add(projectCMBQRY.FieldByName('project_name').AsString);
              projectCMBQRY.Next;
              projectCMB.Refresh;
           end;

        //release resources
        projectCMBQRY.Close;
    end;



end;

procedure TAdmin.tfinishedCMBChange(Sender: TObject);
begin
           Button4.Enabled := tfinishedCMB.Text <> '';
end;

end.


