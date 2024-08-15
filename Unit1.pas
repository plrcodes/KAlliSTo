unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Menus, Audio, ComCtrls;

{const fname='kallisto.raw';}
 const vol=100;

type
  pointtype=array[1..17] of longint;
  wtable = array[1..600] of smallint;
  step = record
          hammeron:boolean;{ in file: nylon:=bars[1].hammeron}
          note:word;
          volume:shortint;
          tempo:word;
          {in file: first:tempo,second:shuffle,third:global damp,fourth:0=loop else 1,
          fifth:version no (to calculate corrections of offset) sixth: auto advance state}
          damp:shortint;
          pluckpos:shortint;  {not enabled yet}
          end;
  TMain = class(TForm)
    Speed: TEdit;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Renderandgo1: TMenuItem;
    Cancel1: TMenuItem;
    About1: TMenuItem;
    AboutKAlliSTo1: TMenuItem;
    Transpose1: TMenuItem;
    renderbutton: TImage;
    upimage: TImage;
    downimage: TImage;
    Panel2: TPanel;
    Image1: TImage;
    Step1text: TLabel;
    step2text: TLabel;
    step3text: TLabel;
    step4text: TLabel;
    step5text: TLabel;
    step6text: TLabel;
    step7text: TLabel;
    step8text: TLabel;
    step9text: TLabel;
    step10text: TLabel;
    step11text: TLabel;
    step12text: TLabel;
    step13text: TLabel;
    step14text: TLabel;
    step15text: TLabel;
    step16text: TLabel;
    hammerbutton: TImage;
    uphammer: TImage;
    downhammer: TImage;
    step2block: TShape;
    step15block: TShape;
    step13block: TShape;
    step12block: TShape;
    step11block: TShape;
    step10block: TShape;
    step9block: TShape;
    step8block: TShape;
    step7block: TShape;
    step6block: TShape;
    step5block: TShape;
    step4block: TShape;
    step3block: TShape;
    step14block: TShape;
    step1block: TShape;
    step16block: TShape;
    Label1: TLabel;
    timbrebutton: TImage;
    label6: TLabel;
    Label5: TLabel;
    spareledon: TImage;
    spareledoff: TImage;
    hammerled: TImage;
    steelled: TImage;
    nylonled: TImage;
    curs1: TImage;
    curs16: TImage;
    curs2: TImage;
    curs3: TImage;
    curs4: TImage;
    curs5: TImage;
    curs6: TImage;
    curs7: TImage;
    curs10: TImage;
    curs8: TImage;
    curs9: TImage;
    curs11: TImage;
    curs12: TImage;
    curs13: TImage;
    curs14: TImage;
    curs15: TImage;
    curson: TImage;
    cursoff: TImage;
    NothingYet1: TMenuItem;
    Label2: TLabel;
    Shuffle: TEdit;
    Outputbutton: TImage;
    loopled: TImage;
    decayled: TImage;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    globaldampbar: TTrackBar;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Bevel1: TBevel;
    fretpanel: TPanel;
    fretboard: TImage;
    E0: TShape;
    E1: TShape;
    E2: TShape;
    E3: TShape;
    e4: TShape;
    e5: TShape;
    a0: TShape;
    a1: TShape;
    a2: TShape;
    a3: TShape;
    a4: TShape;
    a5: TShape;
    d0: TShape;
    d1: TShape;
    d2: TShape;
    d3: TShape;
    d4: TShape;
    d5: TShape;
    g0: TShape;
    g1: TShape;
    g2: TShape;
    g3: TShape;
    g4: TShape;
    g5: TShape;
    b0: TShape;
    b1: TShape;
    b2: TShape;
    b3: TShape;
    b4: TShape;
    b5: TShape;
    he0: TShape;
    he1: TShape;
    he2: TShape;
    he3: TShape;
    he4: TShape;
    he5: TShape;
    Bevel3: TBevel;
    pitchlabel1: TLabel;
    pitchlabel2: TLabel;
    pitchlabel3: TLabel;
    pitchlabel4: TLabel;
    pitchlabel5: TLabel;
    pitchlabel6: TLabel;
    pitchlabel7: TLabel;
    pitchlabel8: TLabel;
    pitchlabel9: TLabel;
    pitchlabel10: TLabel;
    pitchlabel11: TLabel;
    pitchlabel12: TLabel;
    pitchlabel13: TLabel;
    pitchlabel14: TLabel;
    pitchlabel15: TLabel;
    pitchlabel16: TLabel;
    clear: TMenuItem;
    Randomall: TMenuItem;
    mixupnotes: TMenuItem;
    SynchronizetempowithTu1: TMenuItem;
    advbutton: TImage;
    advledall: TImage;
    advledmark: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dampenpopup: TPanel;
    localdampbar: TTrackBar;
    procedure doadvleds;
    procedure dostringleds;
    procedure colourblocks;
    procedure updatedampen;
    procedure updatehammer;
    procedure updatefretboard;
    procedure setactivestep(s:smallint);
    procedure clearpattern (Sender: TObject);
    procedure closeprog(Sender: TObject);
    procedure Karplus(point:pointtype; fourbars:longint);
    procedure initall(Sender: TObject);
    procedure renderdown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure renderup(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure rendergo(Sender: TObject);
    procedure buttondown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure buttonup(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure stepstate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
   procedure SpeedChange(Sender: TObject);
    procedure changestringtype(Sender: TObject);
    procedure changehammer(Sender: TObject);
    procedure gotostep(Sender: TObject);
    procedure showabout(Sender: TObject);
    procedure doendleds;
    procedure changeendtype(Sender: TObject);
    procedure updatedamp(Sender: TObject);
    procedure globaldamp(Sender: TObject);
    procedure changeshuffle(Sender: TObject);
    procedure dofret(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dotranspose(Sender:Tobject);
    procedure transposeit(transpose:smallint);
    procedure findcomponentno(Sender: TObject);
    procedure RandomallClick(Sender: TObject);
    procedure clearClick(Sender: TObject);
    procedure mixupnotesClick(Sender: TObject);
    procedure nextstep(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dotemposync(Sender: TObject);
    procedure doadvance(Sender: TObject);
    procedure hidepopup(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure localdamp(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  Nylon,loop:boolean;
  rawfile:file of smallint;
  sourcefile:file of step;
  hammerstate:boolean;
  wavtable,current,pluck:wtable;
  currentstep,
  max,
  tuMajorVersion,
  tuMinorVersion,
  tuMainTempo   : integer;
  seqlength : longint;
  globaltempo,globalshuffle : smallint;
  damp:real;
  tuSoundFileName,
  tuSourceFileName,
  fname:string;
  bar:array[1..16] of step;
  advance:integer;
  notelabeloffset:integer; //this is pitchlabel1.componentindex -1
  fretnumoffset:integer; //this is e0.componentindex (note difference with above)
  //both of these will be commuted to constants in release version
implementation

uses Unit2, Unit3, Unit4;

{$R *.DFM}

function validateEditPluginCall : boolean;
var
  ok      : boolean;
  e, maj,
  min     : integer;
  parm1,
  parm2,
  parm3,
  parm4,
  parm5   : string;
begin
  ok := false;
  if paramCount > 2 then
    begin
      parm1 := paramStr( 1 );
      parm2 := paramStr( 2 );
      parm3 := paramStr( 3 );
      parm4 := paramStr( 4 );
      ok := true;
      val( parm1, maj, e );
      if e > 0 then ok := false;
      val( parm2, min, e );
      if e > 0 then ok := false;
    end;
  if ok then
    begin
      tuMajorVersion   := maj;
      tuMinorVersion   := min;
      tuSoundFileName  := parm3;
      tuSourceFileName := parm4;
      If tuMajorVersion>=2 then parm5:=paramstr ( 5 );
      val( parm5, tuMainTempo,e);
     // showMessage('Tu version: '+parm1+'.'+parm2+' Output file: '+parm3+' Source file '+parm4+' Tempo:'+parm5);
    end;
  validateEditPluginCall := ok;
end;

procedure TMain.closeprog(Sender: TObject);
begin
application.terminate;
end;

procedure TMain.karplus(point:pointtype; fourbars:longint);
var numblocks,stepcount:integer;
    wavpos,count,biggest,lower,upper,overflow:longint;
    source,previous:smallint;

    function dampcheck(thisstep:integer):real;
             var remain:integer;
                 temp:real;

             begin
                 remain:=20-bar[thisstep].damp;
                 temp:=(0.006*remain) +0.9;
                 If bar[thisstep].damp=0 then temp:=1;
                 If temp>1 then temp:=1;
                 dampcheck:=temp
                 end; {dampcheck}


begin
{run the synth thang and write to the file}
Assignfile(rawfile,fname);
rewrite(rawfile);
wavpos:=1;
biggest:=bar[1].note;
overflow:=biggest + 1;
For stepcount:=1 to 16 do begin
    lower:=point[stepcount]+1;
    upper:=point[stepcount+1];
    If not(bar[stepcount].volume=0) then
       begin
       biggest:=bar[stepcount].note;
       damp:=dampcheck(stepcount);
       If components[biggest] is tshape then           //note selection
              biggest:=tshape(components[biggest]).tag;
        overflow:=biggest + 1;
       If not(bar[stepcount].hammeron) then
           begin
           current:=pluck;
           wavtable:=pluck;
           //damp:=dampcheck(stepcount);
           end
           end; {if..if}
    For count:=lower to upper do begin
        If nylon then wavtable[wavpos-1]:=current[wavpos-1];
        current[wavpos]:=(wavtable[wavpos]shr 1 + wavtable[wavpos -1] shr 1);  {should be faster}
        current[wavpos]:=round(damp*current[wavpos]);
        write(rawfile,current[wavpos]);
        Inc(wavpos);
        If wavpos>=overflow then
           begin
           wavpos:=1;
           current[1]:=(wavtable[1]shr 1 + current[biggest] shr 1);
           current[1]:=round(damp*current[1]);
           write(rawfile,current[1]);
           inc(wavpos);
           wavtable:=current
           end
        end
    end;
closefile(rawfile)
end;

procedure Tmain.clearpattern (Sender: TObject);
{inits the sequencer- clears everything}
Var count:integer;
Begin
For count:=1 to 16 do
    begin
    bar[count].hammeron:=true;
    bar[count].note:=0;
    bar[count].volume:=100
    end
end; {clearpattern}

procedure tmain.doadvleds;
begin
case advance of
0: begin
   advledall.picture:=spareledoff.picture;
   advledmark.picture:=spareledoff.picture;
   end;
1: begin
   advledall.picture:=spareledon.picture;
   advledmark.picture:=spareledoff.picture;
   end;
2: begin
   advledall.picture:=spareledoff.picture;
   advledmark.picture:=spareledon.picture;
   end;
   end {case}
end; {update advance leds}

procedure tmain.dostringleds;
begin
If Nylon then
   begin
        steelled.picture:=spareledoff.picture;
        nylonled.picture:=spareledon.picture
        end
   else begin
        steelled.picture:=spareledon.picture;
        nylonled.picture:=spareledoff.picture;
        end
end;

procedure tmain.colourblocks;
begin
If (bar[1].volume=0) then step1block.brush.color:=$007FBF7F
   else step1block.brush.color:=clblack ;
If (bar[2].volume=0) then step2block.brush.color:=$007FBF7F
   else If bar[2].hammeron then step2block.brush.color:=clgray else step2block.brush.color:=clblack ;
If (bar[3].volume=0) then step3block.brush.color:=$007FBF7F
   else If bar[3].hammeron then step3block.brush.color:=clgray else step3block.brush.color:=clblack ;
If (bar[4].volume=0) then step4block.brush.color:=$007FBF7F
   else If bar[4].hammeron then step4block.brush.color:=clgray else step4block.brush.color:=clblack ;
If (bar[5].volume=0) then step5block.brush.color:=$007FBF7F
   else If bar[5].hammeron then step5block.brush.color:=clgray else step5block.brush.color:=clblack ;
If (bar[6].volume=0) then step6block.brush.color:=$007FBF7F
   else If bar[6].hammeron then step6block.brush.color:=clgray else step6block.brush.color:=clblack ;
If (bar[7].volume=0) then step7block.brush.color:=$007FBF7F
   else If bar[7].hammeron then step7block.brush.color:=clgray else step7block.brush.color:=clblack ;
If (bar[8].volume=0) then step8block.brush.color:=$007FBF7F
   else If bar[8].hammeron then step8block.brush.color:=clgray else step8block.brush.color:=clblack ;
If (bar[9].volume=0) then step9block.brush.color:=$007FBF7F
   else If bar[9].hammeron then step9block.brush.color:=clgray else step9block.brush.color:=clblack ;
If (bar[10].volume=0) then step10block.brush.color:=$007FBF7F
   else If bar[10].hammeron then step10block.brush.color:=clgray else step10block.brush.color:=clblack ;
If (bar[11].volume=0) then step11block.brush.color:=$007FBF7F
   else If bar[11].hammeron then step11block.brush.color:=clgray else step11block.brush.color:=clblack ;
If (bar[12].volume=0) then step12block.brush.color:=$007FBF7F
   else If bar[12].hammeron then step12block.brush.color:=clgray else step12block.brush.color:=clblack ;
If (bar[13].volume=0) then step13block.brush.color:=$007FBF7F
   else If bar[13].hammeron then step13block.brush.color:=clgray else step13block.brush.color:=clblack ;
If (bar[14].volume=0) then step14block.brush.color:=$007FBF7F
   else If bar[14].hammeron then step14block.brush.color:=clgray else step14block.brush.color:=clblack ;
If (bar[15].volume=0) then step15block.brush.color:=$007FBF7F
   else If bar[15].hammeron then step15block.brush.color:=clgray else step15block.brush.color:=clblack ;
If (bar[16].volume=0) then step16block.brush.color:=$007FBF7F
   else If bar[16].hammeron then step16block.brush.color:=clgray else step16block.brush.color:=clblack ;
//setactivestep(1);
end;

procedure tmain.updatehammer;
begin
If currentstep=1 then bar[currentstep].hammeron:=false;
If bar[currentstep].hammeron
   then hammerled.picture:=spareledon.picture
   else hammerled.picture:=spareledoff.picture;
end;

procedure tmain.updatedampen;
begin
//dampbar.position:=bar[currentstep].damp;
end;

procedure tmain.updatefretboard;
var count:integer;
begin
 for count:=fretnumoffset to fretnumoffset+35 do
           If components[count] is tshape then
              tshape(components[count]).brush.style:=bsclear;
              tlabel(components[notelabeloffset+currentstep]).caption:='-';
           If not(bar[currentstep].note=0) then
           If not(bar[currentstep].volume=0)
           then
           begin
                tshape(components[bar[currentstep].note]).brush.style:=bssolid;
                tshape(components[bar[currentstep].note]).brush.color:=$00A39CBF;
                tlabel(components[notelabeloffset+currentstep]).caption:=tshape(components[bar[currentstep].note]).hint
           end;
dampenpopup.enabled:=false;
dampenpopup.visible:=false;
end;

procedure tmain.setactivestep (s:smallint);
begin
case currentstep of
     1:curs1.picture:=cursoff.picture;
     2:curs2.picture:=cursoff.picture;
     3:curs3.picture:=cursoff.picture;
     4:curs4.picture:=cursoff.picture;
     5:curs5.picture:=cursoff.picture;
     6:curs6.picture:=cursoff.picture;
     7:curs7.picture:=cursoff.picture;
     8:curs8.picture:=cursoff.picture;
     9:curs9.picture:=cursoff.picture;
     10:curs10.picture:=cursoff.picture;
     11:curs11.picture:=cursoff.picture;
     12:curs12.picture:=cursoff.picture;
     13:curs13.picture:=cursoff.picture;
     14:curs14.picture:=cursoff.picture;
     15:curs15.picture:=cursoff.picture;
     16:curs16.picture:=cursoff.picture;
     end; {case}
currentstep:=s;
case currentstep of
     1:curs1.picture:=curson.picture;
     2:curs2.picture:=curson.picture;
     3:curs3.picture:=curson.picture;
     4:curs4.picture:=curson.picture;
     5:curs5.picture:=curson.picture;
     6:curs6.picture:=curson.picture;
     7:curs7.picture:=curson.picture;
     8:curs8.picture:=curson.picture;
     9:curs9.picture:=curson.picture;
     10:curs10.picture:=curson.picture;
     11:curs11.picture:=curson.picture;
     12:curs12.picture:=curson.picture;
     13:curs13.picture:=curson.picture;
     14:curs14.picture:=curson.picture;
     15:curs15.picture:=curson.picture;
     16:curs16.picture:=curson.picture;
     end; {case}
updatedampen;
updatehammer;
Updatefretboard;
end;

procedure TMain.initall(Sender: TObject);
//new additions to source format: version number, auto advance state : 27 Jan 2002
var count:integer;
    ave:real;
    value:real;
    val:smallint;
    dog:string;

    function filter(w:wtable; its:shortint):wtable;
             var c:shortint;
                 posi:smallint;
             begin
             for c:=0 to its do
                 for posi:=1 to max do
                     If posi=1 then w[posi]:=w[posi]shr 1 + w[max] shr 1 else
                     w[posi]:=w[posi]shr 1  + w[posi-1]shr 1;
             filter:=w;
             end;{filter}
begin
If not(validateeditplugincall) then
   begin
   showmessage('Invalid parameters passed by Tu!');
   application.terminate;
   end;
//initialise the componentindex values-
notelabeloffset:=pitchlabel1.componentindex -1;
fretnumoffset:=e0.componentindex;
// replace with constants for release version
//tempo matching
If tumajorversion>=2 then
   begin
   globaltempo:=tumaintempo;
   speed.text:=inttostr(globaltempo);
   end else synchronizetempowithtu1.enabled:=false;
//end tempo matching
damp:=1;
Loop:=true;
Doendleds;
Nylon:=true; {set string material}
dostringleds;
hammerled.picture:=spareledoff.picture;
randomize;          { start wavtable}
fname:=tusoundfilename;
ave:=0;
max:=600;

for count:=1 to max do
    begin
   // If ((count>30) and (count<100))then pluck[count]:=32760
   //    else pluck[count]:=0;      //work
    value:=random(32767);
    val:=trunc(value) ;
    If odd(val) then val:=-val;
    pluck[count]:=val;
    wavtable[count]:=0;
    //str(val,dog);
    //ave:=ave+val;
    end;
current:=wavtable;
pluck:=filter(pluck, 3);
//ave:=ave/max;
//str(ave:1:1,dog);
//edit2.text:=dog; {end wavtable}
If fileExists(tusourcefilename) then
   begin
   assignfile(sourcefile,tusourcefilename);
   reset(sourcefile);
   for count:=1 to 16 do
       begin
       read(sourcefile,bar[count]);
       If not(bar[count].volume=0) then
          tlabel(components[notelabeloffset+count]).caption:=tshape(components[bar[count].note]).hint;
       end;
   closefile(sourcefile);
   nylon:=bar[1].hammeron;
   dostringleds;
   speed.text:=inttostr(bar[1].tempo);
   speedchange(speed);
   shuffle.text:=inttostr(bar[2].tempo);
   changeshuffle(shuffle);
   globaldampbar.position:=bar[3].tempo;
   If bar[4].tempo=0 then loop:=true else loop:=false;
   doendleds;
   //import from older version part 2
   if bar[5].tempo=0 then
      showmessage('Kallisto v1.0 loop imported!');
   //import from older version part 1;
   for count:=1 to 16 do
       if bar[5].tempo=0 then bar[count].note:=bar[count].note + 2;
   if bar[5].tempo>1 then
   showmessage('This file was created with a newer version of Kallisto. Please download the latest version');
   advance:=bar[6].tempo;
   doadvleds;
   end{ If file exists then}
else
   For count:=1 to 16 do {start sequence}
    with bar[count] do
         begin
         hammeron:=false;
         note:=fretnumoffset;
         volume:=0;
         tempo:=0;
         damp:=0;
         end;  {end sequence}
colourblocks;
setactivestep(1);
end;

procedure TMain.renderdown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
{change to down image}
renderbutton.picture:=downimage.picture;
end;

procedure TMain.renderup(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
{change to up image}
renderbutton.picture:=upimage.picture
end;

procedure TMain.rendergo(Sender: TObject);
     var steppoint:pointtype;
         fourbars,count:longint;
         num,er:integer;
         dog:string;

     procedure findsteppoints;
               var steplength,count,shuflength:integer;
                   running:longint;
               function length(bpm:integer):integer;
                         var len:integer;
                             rlen:real;
                             begin
                             rlen:=2646000/bpm;    {one minute*44.1 khz divided by tempo}
                             len:=round(rlen/4);  {divided by four to give length of each step}
                             length:=len;
                             fourbars:=round(rlen*16); {actually four bars}
                             end; {barlength}
            begin
            steplength:=length(globaltempo);
            shuflength:=round(steplength/100 * globalshuffle);
            running:=0;
            for count:=1 to 17 do begin
                steppoint[count]:=running;
                running:=running + steplength;
                end; {for do}
            for count:=1 to 16 do
                If odd(count) then steppoint[count]:=steppoint[count]+ shuflength;
            If not(loop) then steppoint[17]:=fourbars;
            end; {findsteppoints}



begin
speedchange(speed);
findsteppoints;
karplus(steppoint,fourbars);
bar[1].hammeron:=nylon;
val(speed.text,num,er);
bar[1].tempo:=num; {tempo};
val(shuffle.text,num,er);
bar[2].tempo:=num; {shuffle}
bar[3].tempo:=globaldampbar.position; {global dampening}
If not(loop) then bar[4].tempo:=1 else bar[4].tempo:=0;
bar[5].tempo:=1;
bar[6].tempo:=advance;
assignfile(sourcefile,tusourcefilename);
rewrite(sourcefile);
for count:=1 to 16 do
    write(sourcefile,bar[count]);
closefile(sourcefile);
If not(loop) then MessageDlg('Decay selected- remember to set sample type to stream and pitch to fit 4 measures!',mtInformation, [mbOK], 0);
application.terminate;
end;

procedure TMain.buttondown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
(sender as Timage).picture:=downhammer.picture;
end;

procedure TMain.buttonup(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
(Sender as Timage).picture:=uphammer.picture;
{led}
end;


procedure TMain.stepstate(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var stepno:shortint;

Begin
stepno:=(sender as tshape).tag;
setactivestep(stepno);
localdampbar.position:=bar[currentstep].damp;
IF button=mbright then
   begin
   dampenpopup.left:=(sender as tshape).left +120;
   dampenpopup.top:=(sender as tshape).top +30;
   dampenpopup.enabled:=true;
   dampenpopup.visible:=true;
   end else
   begin

If (sender as tshape).brush.color=$007fbf7f then
    begin
        (sender as tshape).brush.color:=clblack;
        If bar[currentstep].hammeron then(sender as tshape).brush.color:=clgray;
        bar[currentstep].volume:=100;
        end
    else begin
        (sender as tshape).brush.color:=$007fbf7f;
        bar[currentstep].volume:=0;
         end;
updatefretboard; //big fuckup here
end;{else}
end;

procedure TMain.SpeedChange(Sender: TObject);
var num,er:integer;
begin
val(speed.text,num,er);
If num<30 then speed.text:='30';
If num>303 then speed.text:='303';
val(speed.text,globaltempo,er);
bar[1].tempo:=globaltempo;
end;

procedure TMain.changestringtype(Sender: TObject);
begin
Nylon:=not(nylon);
dostringleds;
end;

procedure TMain.changehammer(Sender: TObject);
begin
{If not(currentstep=1) then  }
bar[currentstep].hammeron:=not(bar[currentstep].hammeron);
updatehammer;
colourblocks;
end;

procedure TMain.gotostep(Sender: TObject);
var stepno:smallint;
begin
stepno:=(sender as tlabel).tag;
setactivestep(stepno);
end;

procedure TMain.showabout(Sender: TObject);
begin
form2.showmodal;
end;

procedure tmain.doendleds;
begin
If loop then
   begin
        loopled.picture:=spareledon.picture;
        decayled.picture:=spareledoff.picture;
        end
   else begin
        loopled.picture:=spareledoff.picture;
        decayled.picture:=spareledon.picture
        end
end;
procedure TMain.changeendtype(Sender: TObject);
begin
Loop:=not(loop);
doendleds;
end;

procedure TMain.updatedamp(Sender: TObject);
begin
{nothing yet}
//bar[currentstep].damp:=dampbar.position;
end;

procedure TMain.globaldamp(Sender: TObject);
var count:smallint;
begin
for count:=1 to 16 do
    bar[count].damp:=globaldampbar.position;
updatedampen;
end;

procedure TMain.changeshuffle(Sender: TObject);
var er:integer;
begin
val(shuffle.text,globalshuffle,er);
If globalshuffle<0 then shuffle.text:='0';
If globalshuffle>50 then shuffle.text:='50';
val(shuffle.text,globalshuffle,er);
bar[2].tempo:=globalshuffle;
end;

procedure TMain.dofret(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var count:integer;
begin
bar[currentstep].note:=(sender as tshape).componentindex;  //fix componentindex
IF button=mbright then bar[currentstep].hammeron:=true
                  else bar[currentstep].hammeron:=false;
Updatehammer;
If not(bar[currentstep].volume=0) then
If components[notelabeloffset+currentstep]is tlabel then
              tlabel(components[notelabeloffset+currentstep]).caption:=(sender as tshape).hint;
If (sender as tshape).brush.style=bsclear then
           begin
           for count:=fretnumoffset to fretnumoffset+35 do
           If components[count] is tshape then
              tshape(components[count]).brush.style:=bsclear;
           (sender as tshape).brush.style:=bssolid;
           (sender as tshape).brush.color:=$00A39CBF;
            end; {if}
end;{clicknote}

procedure TMain.dotranspose(Sender: TObject);
begin
transposeform.showmodal;
end;

Procedure Tmain.transposeit(transpose: smallint);
var cat:string;
    count:integer;

    function changefret(fret:integer):integer;
             //must be updated each time a changetakes place in interface:
             //this uses componentindex values so this is dependent on no. of visual components
             //last updated for 1.1
             var target,count,temp:integer;
             begin
             If fret=0 then exit;
             target:=fret;
             If transpose>0 then
                For count:=1 to transpose do
                    begin
                    case target of
                    44 : inc(target);
                    50 : inc(target);
                    56 : inc(target);
                    //57 : inc(target,2);
                    62 : inc(target,2);
                    68 : inc(target)
                    end;
                    inc(target);
                    end;{for do}
            If transpose<0 then
                for count:=transpose to -1 do
                    begin
                    case target of
                    45 : dec(target);
                    51 : dec(target);
                    57 : dec(target);
                    //60 : dec(target,2);
                    63 : dec(target,2);
                    69 : dec(target)
                    end;
                    dec(target);
                    end; {else.. for do}
             //fixed bug in below lines:changed = to> and < (2 Jan 2002)
             If target<fretnumoffset then target:=fretnumoffset;
             If target>(fretnumoffset + 35) then target:=fretnumoffset + 35;
             changefret:=target;
             //now we will update the labels telling us the note names
             For count:=1 to 16 do
                 begin
                 If NOT(bar[count].volume=0) then
                  tlabel(components[notelabeloffset+count]).caption:=tshape(components[bar[count].note]).hint;
                 end;
             end;{changefret}

begin
str(transpose,cat);
{this will be messy};
For count:=1 to 16 do bar[count].note:=changefret(bar[count].note);
updatefretboard;
end;

procedure TMain.findcomponentno(Sender: TObject);
var temp:string;
begin
temp:='dog';
If sender is tshape then
   begin
   temp:=inttostr((sender as tshape).componentindex);
   showmessage(temp);
   (sender as tshape).hint:=temp;
   end;
If sender is tlabel then
   begin
   temp:=inttostr((sender as tlabel).componentindex);
   (sender as tlabel).caption:=temp;
   end;
end;

procedure TMain.RandomallClick(Sender: TObject);
// Added Jan 2002
var count:integer;
begin
randomize;
for count:=1 to 16 do begin
with bar[count] do
     begin
     If not(count=1) then
        if odd(random(128)) then hammeron:=true else hammeron:=false;
     note:=fretnumoffset+(random(35));
     If odd(random(128)) then
                         begin
                         volume:=100;
                         tlabel(components[notelabeloffset+count]).caption:=tshape(components[note]).hint;
                         end
          else
          begin
          volume:=0;
          tlabel(components[notelabeloffset+count]).caption:='-';
          end;
     //damp:;  haven't done the dampen thing yet
     //pluckpos:shortint;  {not enabled yet}
     end;
colourblocks;
setactivestep(1);
end;

end;

procedure TMain.clearClick(Sender: TObject);
//Added Jan 2002
var count:integer;
begin
For count:=1 to 16 do begin
tlabel(components[notelabeloffset+count]).caption:='-';
with bar[count] do
         begin
         hammeron:=false;
         note:=fretnumoffset;
         volume:=0;
         tempo:=0;
         damp:=0;
         end;  {end sequence}
end;
globalshuffle:=0;
shuffle.text:='0';
colourblocks;
setactivestep(1);
end;

procedure TMain.mixupnotesClick(Sender: TObject);
//Added Jan 2002 
var tempbar:array[1..16] of step;
    used:array[1..16] of boolean;
    count,rand:integer;

function randomstep(time:integer):step;
var temp:step;
    dog,cat:integer;
begin
If time=16 then
   begin
        for dog:=1 to 16 do
        If NOT(used[dog])then temp:=tempbar[dog]
   end
 else
     begin
     dog:=random(15)+1;
     while used[dog] do
           begin
           inc(dog);
           If dog=17 then dog:=1;
           end;
     temp:=tempbar[dog];
     used[dog]:=true
     end;{else}
randomstep:=temp;
end;

begin
randomize;
for count:=1 to 16 do
    begin
    tempbar[count].hammeron:=bar[count].hammeron;
    tempbar[count].note:=bar[count].note;
    tempbar[count].volume:=bar[count].volume;
    tempbar[count].tempo:=bar[count].tempo;
    tempbar[count].damp:=bar[count].damp;
    tempbar[count].pluckpos:=bar[count].pluckpos;
    used[count]:=false;
    end; {init}
for count:=1 to 16 do begin
      bar[count]:=randomstep(count);
      If bar[count].volume=0 then tlabel(components[notelabeloffset+count]).caption:='-'
      else tlabel(components[notelabeloffset+count]).caption:=tshape(components[bar[count].note]).hint;
      end;{process}
colourblocks;
setactivestep(1);
//showmessage('all done');
end;


procedure TMain.nextstep(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var flag:integer;
begin
     flag:=0;
     if advance=0 then
                  begin
                  bar[currentstep].volume:=100;
                  tlabel(components[notelabeloffset+currentstep]).caption:=(sender as tshape).hint;
                  colourblocks;
                  end;
     if advance=1 then
                  begin
                  bar[currentstep].volume:=100;
                  If components[notelabeloffset+currentstep]is tlabel then
                  tlabel(components[notelabeloffset+currentstep]).caption:=(sender as tshape).hint;
                  colourblocks;
                  If currentstep=16 then setactivestep(1) else setactivestep(currentstep+1);
                  end;
     If advance=2 then
                  begin
                  if components[notelabeloffset+currentstep]is tlabel then
                  tlabel(components[notelabeloffset+currentstep]).caption:=(sender as tshape).hint;
                  colourblocks;
                  repeat
                  If currentstep=16 then setactivestep(1) else setactivestep(currentstep+1);
                  inc(flag);
                  until not(bar[currentstep].volume=0) or (flag=16);
                  If flag>15 then showmessage('The checked steps auto advance mode requires at least 1 note to be selected in the note grid.');
                  end;
end;

procedure TMain.dotemposync(Sender: TObject);
begin
   globaltempo:=tumaintempo;
   speed.text:=inttostr(globaltempo);
end;

procedure TMain.doadvance(Sender: TObject);
//added 19 Jan 2002
begin
//change autoadvance settings
case advance of
0: advance:=1;
1: advance:=2;
2: advance:=0;
end;
doadvleds;
end;

procedure TMain.hidepopup(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
dampenpopup.enabled:=false;
dampenpopup.visible:=false;
end;

procedure TMain.localdamp(Sender: TObject);
begin
bar[currentstep].damp:=localdampbar.position;
end;

end.
