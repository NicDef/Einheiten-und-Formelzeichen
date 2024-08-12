unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ActnList;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    btnStart: TButton;
    cmbKlasse: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    radLeicht: TRadioButton;
    radSchwer: TRadioButton;
    rgrpSchwierigkeit: TRadioGroup;
    procedure btnStartClick(Sender: TObject);
    procedure cmbKlasseChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  multiplier: Integer; // 1 -> schwer ; 2 -> leicht
  timeLeft: Integer;
  maxIdx: Integer;

implementation
  uses unit2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  maxIdx := 0;
end;

procedure TForm1.btnStartClick(Sender: TObject);
begin
     // Schwierigkeit bestimmen
     if radLeicht.Checked then
        multiplier := 2  // leicht
     else if radSchwer.Checked then
        multiplier := 1 // schwer
     else if (not radLeicht.Checked) and (not radSchwer.Checked) then
        ShowMessage('Alarm');

     Form2.Show; // Zeige den Test
     Hide;       // Erklärung ausblenden
end;

procedure TForm1.cmbKlasseChange(Sender: TObject);
begin
  case cmbKlasse.ItemIndex of
  0: maxIdx := 11;
  1: maxIdx := 17;
  2: maxIdx := 23;
  3: maxIdx := 25;
  4: maxIdx := 28;
  5: maxIdx := 32;
  end;
end;

end.

