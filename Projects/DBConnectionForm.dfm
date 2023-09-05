object DataModule2: TDataModule2
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object conDB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=mngDB;Data Source=DESKTOP-34I8QPJ\SQLEX' +
      'PRESS'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 480
    Top = 24
  end
  object UserTbl: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'users'
    Left = 480
    Top = 136
  end
  object ProjectsTbl: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'projects'
    Left = 152
    Top = 248
  end
  object TasksTbl: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'Tasks'
    Left = 712
    Top = 240
  end
  object BugsTbl: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'Bugs'
    Left = 856
    Top = 240
  end
  object UserSrc: TDataSource
    DataSet = UserTbl
    Left = 488
    Top = 232
  end
  object ProjectsSrc: TDataSource
    DataSet = ProjectsTbl
    Left = 152
    Top = 360
  end
  object TasksSrc: TDataSource
    DataSet = ProjectsTbl
    Left = 712
    Top = 352
  end
  object BugsSrc: TDataSource
    DataSet = BugsTbl
    Left = 856
    Top = 352
  end
  object ADOQuery1: TADOQuery
    Connection = conDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from users;')
    Left = 128
    Top = 16
    object ADOQuery1id: TIntegerField
      FieldName = 'id'
    end
    object ADOQuery1name: TStringField
      FieldName = 'name'
    end
    object ADOQuery1lastname: TStringField
      FieldName = 'lastname'
    end
    object ADOQuery1email: TStringField
      FieldName = 'email'
      Size = 50
    end
    object ADOQuery1type: TStringField
      FieldName = 'type'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1password: TStringField
      FieldName = 'password'
    end
  end
  object loggingQr: TADOQuery
    Connection = conDB
    DataSource = UserSrc
    Parameters = <
      item
        Name = 'u_mail'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select password from users'
      'where email = :u_mail')
    Left = 40
  end
  object ProjectsQRY: TADOQuery
    Active = True
    Connection = conDB
    CursorType = ctStatic
    DataSource = ProjectsSrc
    Parameters = <>
    SQL.Strings = (
      
        'select t1.email as ProjectOwner, t2.project_name as ProjectName,' +
        ' t2.description AS ProjectDescription, t2.start_date as StartDat' +
        'e, t2.end_date as EndDate, t2.status as Status from users t1'
      'join projects t2'
      'on t1.id = t2.user_id')
    Left = 152
    Top = 464
  end
  object editedProjectSrc: TDataSource
    DataSet = ProjectsQRY
    Left = 152
    Top = 560
  end
  object TasksQRY: TADOQuery
    Active = True
    Connection = conDB
    CursorType = ctStatic
    DataSource = TasksSrc
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '    t2.project_name AS ProjectName,'
      '    t3.email AS TaskHolder,'
      '    t1.description AS TaskDescription,'
      '    t1.start_date AS StartDate,'
      '    t1.end_date AS EndDate,'
      '    t1.status AS Status'
      'FROM'
      '    Tasks t1'
      'JOIN'
      '    projects t2 ON t1.project_id = t2.id'
      'JOIN'
      '    users t3 ON t1.user_id = t3.id')
    Left = 696
    Top = 472
  end
  object editedTasksSrc: TDataSource
    DataSet = TasksQRY
    Left = 712
    Top = 560
  end
  object user2SRC: TDataSource
    DataSet = uTBL2
    Left = 584
    Top = 256
  end
  object uTBL2: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'users'
    Left = 576
    Top = 160
  end
end
