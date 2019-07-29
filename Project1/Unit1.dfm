object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 589
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 112
    Top = 134
    Width = 153
    Height = 139
    Stretch = True
  end
  object Image2: TImage
    Left = 271
    Top = 134
    Width = 138
    Height = 139
    Stretch = True
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 192
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 16
    Top = 223
    Width = 75
    Height = 26
    Caption = 'BitBtn2'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object DBGrid1: TDBGrid
    Left = 89
    Top = 8
    Width = 488
    Height = 120
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'UserID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DisplayName'
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AccountEnabled'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Photo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Phone'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Note'
        Visible = False
      end>
  end
  object cxGrid1: TcxGrid
    Left = 583
    Top = 8
    Width = 250
    Height = 200
    TabOrder = 3
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource2
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1UserID: TcxGridDBColumn
        DataBinding.FieldName = 'UserID'
      end
      object cxGrid1DBTableView1DisplayName: TcxGridDBColumn
        DataBinding.FieldName = 'DisplayName'
      end
      object cxGrid1DBTableView1AccountEnabled: TcxGridDBColumn
        DataBinding.FieldName = 'AccountEnabled'
      end
      object cxGrid1DBTableView1Photo: TcxGridDBColumn
        DataBinding.FieldName = 'Photo'
      end
      object cxGrid1DBTableView1Phone: TcxGridDBColumn
        DataBinding.FieldName = 'Phone'
      end
      object cxGrid1DBTableView1Address: TcxGridDBColumn
        DataBinding.FieldName = 'Address'
      end
      object cxGrid1DBTableView1Note: TcxGridDBColumn
        DataBinding.FieldName = 'Note'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=crystall;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=NewTest;Data Source=DESKTOP-P1B72R2\' +
      'SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Packe' +
      't Size=4096;Workstation ID=DESKTOP-P1B72R2;Use Encryption for Da' +
      'ta=False;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 240
    Top = 288
  end
  object OpenDialog1: TOpenDialog
    Filter = '*|*.jpg'
    Left = 304
    Top = 288
  end
  object MainMenu1: TMainMenu
    Left = 408
    Top = 288
    object N1: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = N1Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'Photo'
        Size = -1
        Value = Null
      end
      item
        Name = 'id'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Userlist SET Photo=:Photo WHERE id=:id')
    Left = 184
    Top = 288
  end
  object ADOStoredProc1: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'InsertNewPhoto;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@photo'
        Attributes = [paNullable]
        DataType = ftBlob
        Size = 2147483647
        Value = Null
      end
      item
        Name = '@userid'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 40
    Top = 280
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT [UserID]'
      '      ,[DisplayName]'
      '      ,[AccountEnabled]'
      '      ,[Photo]'
      '      ,[Phone]'
      '      ,[Address]'
      '      ,[Note]'
      '  FROM [NewTest].[dbo].[UserList]')
    Left = 32
    Top = 72
    object ADOQuery2UserID: TAutoIncField
      FieldName = 'UserID'
      ReadOnly = True
    end
    object ADOQuery2DisplayName: TWideStringField
      FieldName = 'DisplayName'
      Size = 256
    end
    object ADOQuery2AccountEnabled: TBooleanField
      FieldName = 'AccountEnabled'
    end
    object ADOQuery2Photo: TBlobField
      FieldName = 'Photo'
    end
    object ADOQuery2Phone: TWideStringField
      FieldName = 'Phone'
      Size = 50
    end
    object ADOQuery2Address: TWideStringField
      FieldName = 'Address'
      Size = 100
    end
    object ADOQuery2Note: TWideStringField
      FieldName = 'Note'
      Size = 256
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 32
    Top = 128
  end
end
