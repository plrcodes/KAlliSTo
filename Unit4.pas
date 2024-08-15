unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TDampenpopup = class(TForm)
    Label10: TLabel;
    Label12: TLabel;
    dampbar: TTrackBar;
    Shape1: TShape;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    procedure dodampbar(Sender: TObject);
    procedure leaveit(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dampenpopup: TDampenpopup;

implementation

{$R *.DFM}

procedure TDampenpopup.dodampbar(Sender: TObject);
begin
//null for now
end;

procedure TDampenpopup.leaveit(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
IF button=mbright then modalresult:=mrok;
end;

end.
