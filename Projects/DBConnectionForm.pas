unit DBConnectionForm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModule2 = class(TDataModule)
    conDB: TADOConnection;
    UserTbl: TADOTable;
    ProjectsTbl: TADOTable;
    TasksTbl: TADOTable;
    BugsTbl: TADOTable;
    UserSrc: TDataSource;
    ProjectsSrc: TDataSource;
    TasksSrc: TDataSource;
    BugsSrc: TDataSource;
    ADOQuery1: TADOQuery;
    loggingQr: TADOQuery;
    ADOQuery1id: TIntegerField;
    ADOQuery1name: TStringField;
    ADOQuery1lastname: TStringField;
    ADOQuery1email: TStringField;
    ADOQuery1type: TStringField;
    ADOQuery1password: TStringField;
    ProjectsQRY: TADOQuery;
    editedProjectSrc: TDataSource;
    TasksQRY: TADOQuery;
    editedTasksSrc: TDataSource;
    user2SRC: TDataSource;
    uTBL2: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
