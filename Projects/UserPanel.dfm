object User: TUser
  Left = 0
  Top = 0
  Caption = 'User'
  ClientHeight = 369
  ClientWidth = 1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 176
    Height = 33
    Caption = 'Your actual projects'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
  end
  object helloLBL: TLabel
    Left = 8
    Top = 0
    Width = 6
    Height = 36
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 520
    Top = 56
    Width = 152
    Height = 33
    Caption = 'Your actual tasks'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 232
    Width = 171
    Height = 33
    Caption = 'Change task status'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 95
    Width = 513
    Height = 122
    DataSource = userPSRC
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ProjectName'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Deadline'
        Width = 70
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 520
    Top = 95
    Width = 570
    Height = 122
    DataSource = userTSRC
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ProjectName'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TaskDescription'
        Width = 375
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Deadline'
        Width = 70
        Visible = True
      end>
  end
  object completeTaskBTN: TButton
    Left = 168
    Top = 336
    Width = 91
    Height = 25
    Caption = 'Complete task'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = completeTaskBTNClick
  end
  object tasksCMB: TDBComboBox
    Left = 8
    Top = 296
    Width = 433
    Height = 23
    Style = csDropDownList
    DataField = 'TaskDescription'
    DataSource = userTSRC
    TabOrder = 3
  end
  object deadlineTaskQuery: TADOQuery
    Connection = DataModule2.conDB
    DataSource = DataModule2.TasksSrc
    Parameters = <
      item
        Name = 'user_id'
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'SELECT description'
      'FROM tasks'
      'WHERE end_date <= GETDATE() and user_id =:user_id')
    Left = 1008
    Top = 16
  end
  object userProjectsQRY: TADOQuery
    Active = True
    Connection = DataModule2.conDB
    CursorType = ctStatic
    DataSource = DataModule2.ProjectsSrc
    Parameters = <
      item
        Name = 'globalEmail'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      
        'select t1.project_name as ProjectName, t1.description as Descrip' +
        'tion, t1.end_date as Deadline'
      'from projects t1'
      'join users t2'
      'on t1.user_id = t2.id'
      'and t2.email = :globalEmail')
    Left = 209
    Top = 48
  end
  object userTasksQRY: TADOQuery
    Active = True
    Connection = DataModule2.conDB
    CursorType = ctStatic
    DataSource = DataModule2.TasksSrc
    Parameters = <
      item
        Name = 'globalEmail'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      
        'select t1.project_name as ProjectName, t3.description as TaskDes' +
        'cription, t1.end_date as Deadline'
      'from projects t1'
      'join users t2'
      'on t1.user_id = t2.id'
      'and t2.email = :globalEmail'
      'join Tasks t3'
      'on t3.user_id = t2.id'
      'where t3.status in ('#39'to do'#39', '#39'in progress'#39')')
    Left = 713
    Top = 40
  end
  object updateTaskQRY: TADOQuery
    Connection = DataModule2.conDB
    Parameters = <
      item
        Name = 'taskDesc'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 300
        Value = Null
      end>
    SQL.Strings = (
      'update tasks'
      'set status = '#39'in progress'#39
      'where description = :taskDesc')
    Left = 280
    Top = 360
  end
  object userPSRC: TDataSource
    DataSet = userProjectsQRY
    Left = 312
    Top = 48
  end
  object userTSRC: TDataSource
    DataSet = userTasksQRY
    Left = 808
    Top = 40
  end
  object completeTaskQRY: TADOQuery
    Connection = DataModule2.conDB
    DataSource = userTSRC
    Parameters = <
      item
        Name = 'taskDesc'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 300
        Value = Null
      end>
    SQL.Strings = (
      'update tasks'
      'set status = '#39'completed'#39
      'where description = :taskDesc')
    Left = 120
    Top = 352
  end
  object autoUpdateProjectsQRY: TADOQuery
    Connection = DataModule2.conDB
    DataSource = DataModule2.ProjectsSrc
    Parameters = <
      item
        Name = 'globalEmail'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE projects'
      'SET status = '#39'completed'#39
      'WHERE status = '#39'to do'#39
      '  AND NOT EXISTS ('
      '    SELECT 1'
      '    FROM tasks'
      '    WHERE tasks.project_id = projects.id'
      '      AND tasks.status = '#39'to do'#39
      '  )'
      '  AND EXISTS ('
      '    SELECT 1'
      '    FROM users'
      '    WHERE users.email = :globalEmail'
      '  );'
      ''
      ''
      ''
      '')
    Left = 224
    Top = 232
  end
  object taskShowQRY: TADOQuery
    Connection = DataModule2.conDB
    DataSource = userTSRC
    Parameters = <
      item
        Name = 'globalEmail'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select description from tasks t1'
      'join users t2'
      'on t1.user_id = t2.id'
      'and t2.email = :globalEmail'
      'where t1.status = '#39'to do'#39)
    Left = 352
    Top = 232
  end
end
