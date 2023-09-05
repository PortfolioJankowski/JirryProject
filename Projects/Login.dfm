object SigningForm: TSigningForm
  Left = 0
  Top = 0
  Caption = 'Sign In'
  ClientHeight = 229
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 136
    Height = 33
    Caption = 'Enter your data'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Bahnschrift Condensed'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 33
    Top = 72
    Width = 104
    Height = 23
    Caption = 'Email address'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 33
    Top = 117
    Width = 70
    Height = 23
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 152
    Top = 75
    Width = 177
    Height = 23
    TabOrder = 0
    StyleName = 'Windows'
  end
  object Edit2: TEdit
    Left = 152
    Top = 120
    Width = 177
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
    StyleName = 'Windows'
    OnChange = Edit2Change
  end
  object logInBtn: TButton
    Left = 128
    Top = 176
    Width = 113
    Height = 45
    Caption = 'Log in'
    Enabled = False
    Style = bsCommandLink
    TabOrder = 2
    OnClick = logInBtnClick
  end
  object logQuery: TADOQuery
    Connection = DataModule2.conDB
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'u_mail'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'u_password'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT password FROM users WHERE email = :u_mail AND password = ' +
        ':u_password')
    Left = 320
    Top = 184
  end
end
