unit Manage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, DBConnectionForm,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.StdCtrls;

type
  TManagingForm = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ManagingForm: TManagingForm;

implementation

{$R *.dfm}

procedure TManagingForm.FormCreate(Sender: TObject);
begin
  ManagingForm.Position := poScreenCenter;
end;

end.
