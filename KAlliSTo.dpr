//=================================IMPORTANT================================
// Todo:change ALL types to 32bit where possible
// -this makes Win32 execution MUCH more efficient
//
program KAlliSTo;
//Karplus-strong synth plugin by ?eter
//version 1 december 2001
//1.1 jan 2002- making a bit of a mess
uses
  Forms,
  Unit1 in 'Unit1.pas' {Main},
  Unit2 in '\My Documents\KAlliSTo\Unit2.pas' {form2},
  Unit3 in '\My Documents\KAlliSTo\Unit3.pas' {transposeform};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Kallisto V1.1';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(Tform2, form2);
  Application.CreateForm(Ttransposeform, transposeform);
  Application.Run;
end.
