unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Ttransposeform = class(TForm)
    Panel1: TPanel;
    upone: TLabel;
    Button1: TButton;
    Label1: TLabel;
    downone: TLabel;
    transposeEdit: TEdit;
    Label2: TLabel;
    downfive: TLabel;
    upfive: TLabel;
    procedure changeit(Sender: TObject);
    procedure initTranspose(Sender: TObject);
    procedure leave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  transposeform: Ttransposeform;
  temptranspose:shortint;
implementation

uses Unit1;

{$R *.DFM}

procedure Ttransposeform.changeit(Sender: TObject);

begin
temptranspose:=temptranspose+ (sender as Tlabel).tag;
If temptranspose>12 then temptranspose:=12;
If temptranspose<-12 then temptranspose:=-12;
transposeEdit.text:=inttostr(temptranspose);
end;

procedure Ttransposeform.initTranspose(Sender: TObject);
begin
temptranspose:=0;
transposeEdit.text:=inttostr(temptranspose);
end;

procedure Ttransposeform.leave(Sender: TObject);
begin
If not(temptranspose=0) then main.transposeit(temptranspose);
end;

end.
