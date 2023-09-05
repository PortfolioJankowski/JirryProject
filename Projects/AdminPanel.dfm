object Admin: TAdmin
  Left = 0
  Top = 0
  Caption = 'Admin'
  ClientHeight = 668
  ClientWidth = 958
  Color = clHotLight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  StyleName = 'Windows10 Dark'
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 120
    Height = 33
    Caption = 'Project editor'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 463
    Width = 107
    Height = 28
    Caption = ' Add new task'
    Color = clCaptionText
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label4: TLabel
    Left = 8
    Top = 205
    Width = 129
    Height = 28
    Caption = ' Add new project'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 16
    Top = 239
    Width = 82
    Height = 16
    Caption = 'Project leader'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 180
    Top = 497
    Width = 40
    Height = 16
    Caption = 'Holder'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 497
    Width = 41
    Height = 16
    Caption = 'Project'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 400
    Top = 497
    Width = 66
    Height = 16
    Caption = 'Description'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 776
    Top = 521
    Width = 52
    Height = 16
    Caption = 'End Date'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 416
    Top = 239
    Width = 66
    Height = 16
    Caption = 'Description'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 776
    Top = 215
    Width = 59
    Height = 16
    Caption = 'Start Date'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 776
    Top = 263
    Width = 52
    Height = 16
    Caption = 'End Date'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 256
    Top = 239
    Width = 76
    Height = 16
    Caption = 'Project name'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 776
    Top = 473
    Width = 59
    Height = 16
    Caption = 'Start Date'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 8
    Top = 321
    Width = 97
    Height = 33
    Caption = 'Task editor'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 16
    Top = 575
    Width = 277
    Height = 28
    Caption = 'Delete completed projects and tasks'
    Color = clCaptionText
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object Label16: TLabel
    Left = 16
    Top = 609
    Width = 41
    Height = 16
    Caption = 'Project'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 473
    Top = 609
    Width = 26
    Height = 16
    Caption = 'Task'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 575
    Width = 953
    Height = 220
    Color = clBlack
    ParentBackground = False
    ParentColor = False
    TabOrder = 20
    object DBComboBox1: TDBComboBox
      Left = 175
      Top = 168
      Width = 194
      Height = 23
      Style = csDropDownList
      DataField = 'email'
      DataSource = DataModule2.user2SRC
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 353
    Width = 953
    Height = 220
    Color = clBlack
    ParentBackground = False
    ParentColor = False
    TabOrder = 15
    object holderCMB: TDBComboBox
      Left = 175
      Top = 168
      Width = 194
      Height = 23
      Style = csDropDownList
      DataField = 'email'
      DataSource = DataModule2.user2SRC
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 47
    Width = 953
    Height = 268
    Color = clBlack
    ParentBackground = False
    ParentColor = False
    TabOrder = 9
  end
  object leaderCMB: TDBComboBox
    Left = 16
    Top = 261
    Width = 201
    Height = 23
    Style = csDropDownList
    DataField = 'email'
    DataSource = DataModule2.UserSrc
    TabOrder = 0
    StyleName = 'Windows10 Dark'
  end
  object Button1: TButton
    Left = 813
    Top = 8
    Width = 148
    Height = 33
    Caption = 'Manage your team'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    StyleName = 'Windows10 Dark'
    OnClick = Button1Click
  end
  object projectsGRD: TDBGrid
    Left = 8
    Top = 47
    Width = 953
    Height = 152
    DataSource = DataModule2.editedProjectSrc
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    StyleName = 'Windows10 Dark'
    Columns = <
      item
        Expanded = False
        FieldName = 'ProjectOwner'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ProjectName'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ProjectDescription'
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StartDate'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EndDate'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 80
        Visible = True
      end>
  end
  object pNameEDT: TEdit
    Left = 256
    Top = 261
    Width = 121
    Height = 23
    TabOrder = 3
    StyleName = 'Windows10 Dark'
  end
  object PDescEDT: TEdit
    Left = 416
    Top = 261
    Width = 324
    Height = 23
    TabOrder = 4
    StyleName = 'Windows10 Dark'
  end
  object startDate: TDatePicker
    Left = 854
    Top = 205
    Width = 102
    Color = clNavy
    Date = 45172.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    TabOrder = 5
  end
  object endDate: TDatePicker
    Left = 854
    Top = 257
    Width = 102
    Color = clNavy
    Date = 45172.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    TabOrder = 6
  end
  object ProjectBTN: TButton
    Left = 424
    Top = 290
    Width = 75
    Height = 25
    Caption = 'Add project'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    StyleName = 'Windows10 Dark'
    OnClick = ProjectBTNClick
  end
  object taskGrid: TDBGrid
    Left = 8
    Top = 353
    Width = 953
    Height = 106
    DataSource = DataModule2.editedTasksSrc
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    StyleName = 'Windows10 Dark'
    Columns = <
      item
        Expanded = False
        FieldName = 'ProjectName'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TaskHolder'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TaskDescription'
        Width = 380
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StartDate'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EndDate'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Width = 77
        Visible = True
      end>
  end
  object projectCMB: TDBComboBox
    Left = 16
    Top = 520
    Width = 145
    Height = 23
    Style = csDropDownList
    DataField = 'project_name'
    DataSource = DataModule2.ProjectsSrc
    TabOrder = 10
    StyleName = 'Windows10 Dark'
  end
  object taskdescEDT: TEdit
    Left = 400
    Top = 519
    Width = 340
    Height = 23
    TabOrder = 11
  end
  object tStartDate: TDatePicker
    Left = 854
    Top = 463
    Width = 102
    Color = clNavy
    Date = 45173.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    TabOrder = 12
  end
  object tEndDate: TDatePicker
    Left = 854
    Top = 513
    Width = 102
    Color = clNavy
    Date = 45173.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Bahnschrift'
    Font.Style = []
    TabOrder = 13
  end
  object Button2: TButton
    Left = 424
    Top = 548
    Width = 75
    Height = 25
    Caption = 'Add task'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = Button2Click
  end
  object pfinishedCMB: TDBComboBox
    Left = 16
    Top = 632
    Width = 145
    Height = 23
    Style = csDropDownList
    DataField = 'project_name'
    DataSource = DataModule2.ProjectsSrc
    TabOrder = 16
    OnChange = pfinishedCMBChange
  end
  object tfinishedCMB: TDBComboBox
    Left = 473
    Top = 631
    Width = 256
    Height = 23
    Style = csDropDownList
    DataField = 'description'
    DataSource = DataModule2.TasksSrc
    TabOrder = 17
    OnChange = tfinishedCMBChange
  end
  object Button3: TButton
    Left = 180
    Top = 634
    Width = 101
    Height = 26
    Caption = 'Delete project'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 751
    Top = 628
    Width = 84
    Height = 30
    Caption = 'Delete task'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnClick = Button4Click
  end
  object leadCMBQRY: TADOQuery
    CacheSize = 99
    Connection = DataModule2.conDB
    CursorType = ctStatic
    DataSource = DataModule2.UserSrc
    Parameters = <>
    SQL.Strings = (
      'select * from users;')
    Left = 160
    Top = 208
    object leadCMBQRYemail: TStringField
      FieldName = 'email'
      Size = 50
    end
  end
  object insertProjectQRY: TADOQuery
    Connection = DataModule2.conDB
    Parameters = <
      item
        Name = 'u_email'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'SELECT id FROM users WHERE email = :u_email')
    Left = 616
    Top = 208
  end
  object projectCMBQRY: TADOQuery
    Connection = DataModule2.conDB
    DataSource = DataModule2.ProjectsSrc
    Parameters = <>
    SQL.Strings = (
      'Select * from projects;')
    Left = 104
    Top = 464
  end
  object ProjectToIDQRY: TADOQuery
    Connection = DataModule2.conDB
    Parameters = <
      item
        Name = 'project_name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'SELECT id FROM projects WHERE project_name = :project_name')
    Left = 576
    Top = 472
  end
  object EmailToIDQry: TADOQuery
    Connection = DataModule2.conDB
    Parameters = <
      item
        Name = 'u_email'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'SELECT id FROM users WHERE email = :u_email')
    Left = 696
    Top = 472
  end
  object pfinishedQRY: TADOQuery
    Active = True
    Connection = DataModule2.conDB
    CursorType = ctStatic
    DataSource = DataModule2.ProjectsSrc
    Parameters = <>
    SQL.Strings = (
      'select project_name from projects'
      'where status = '#39'completed'#39';')
    Left = 88
    Top = 584
  end
  object tfinishedQRY: TADOQuery
    Connection = DataModule2.conDB
    DataSource = DataModule2.TasksSrc
    Parameters = <>
    SQL.Strings = (
      'select description from tasks'
      'where status = '#39'completed'#39';')
    Left = 528
    Top = 584
  end
  object deleteProjectQRY: TADOQuery
    Connection = DataModule2.conDB
    DataSource = DataModule2.ProjectsSrc
    Parameters = <
      item
        Name = 'project_name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = 'PROJ1'
      end>
    SQL.Strings = (
      'DELETE FROM projects WHERE project_name = :project_name')
    Left = 304
    Top = 584
  end
  object deleteTaskQRY: TADOQuery
    Connection = DataModule2.conDB
    DataSource = DataModule2.TasksSrc
    Parameters = <
      item
        Name = 'description'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 300
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM Tasks'
      'WHERE description = :description')
    Left = 736
    Top = 576
  end
  object projectDeadlineQRY: TADOQuery
    Connection = DataModule2.conDB
    DataSource = DataModule2.ProjectsSrc
    Parameters = <>
    SQL.Strings = (
      'SELECT project_name'
      'FROM projects'
      'WHERE end_date <= GETDATE()')
    Left = 424
    Top = 8
  end
end
