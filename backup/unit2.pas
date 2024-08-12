unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  MaskEdit, Buttons;

type

  { TForm2 }

  TForm2 = class(TForm)
    BtnWiederholen: TBitBtn;
    BtnBeenden: TBitBtn;
    BtnAuswertung: TButton;
    Image1: TImage;
    LblPunkte: TLabel;
    LblNote: TLabel;
    LblGroesse: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LblFZ: TLabel;
    LblE: TLabel;
    Label0: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LblTimer: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    timer: TTimer;
    procedure BtnBeendenClick(Sender: TObject);
    procedure BtnAuswertungClick(Sender: TObject);
    procedure BtnWiederholenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: char);
    procedure KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure timerTimer(Sender: TObject);
  private
    procedure updateTimerDisplay;
    function ArrayContains(const Arr: array of integer; Value: Integer): Boolean;
  public

  end;

type
  TDataSet = record
    value: Array[0..32] of string;
    symbol: Array[0..32] of string;
    &unit: Array[0..32] of string;
  end;

var
  Form2: TForm2;
  NewForm2: TForm2;
  data: TDataSet;
  points: integer;
  used: array[1..10] of Integer;

implementation
  uses unit1;



{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.Height := 720;
  points := 0;

  data.value[0] := 'Temperatur';
  data.symbol[0] := 'T';
  data.&unit[0] := '°C;K';
  data.value[1] := 'Masse';
  data.symbol[1] := 'm';
  data.&unit[1] := 'kg';
  data.value[2] := 'Volumen';
  data.symbol[2] := 'V';
  data.&unit[2] := 'm³';
  data.value[3] := 'Dichte';
  data.symbol[3] := 'ρ';
  data.&unit[3] := 'g/cm³';
  data.value[4] := 'Weg';
  data.symbol[4] := 's';
  data.&unit[4] := 'm';
  data.value[5] := 'Zeit';
  data.symbol[5] := 't';
  data.&unit[5] := 's';
  data.value[6] := 'Geschwindigkeit';
  data.symbol[6] := 'v';
  data.&unit[6] := 'm/s';
  data.value[7] := 'Kraft';
  data.symbol[7] := 'F';
  data.&unit[7] := 'N';
  data.value[8] := 'Federkonstante';
  data.symbol[8] := 'D';
  data.&unit[8] := 'N/m';
  data.value[9] := 'Reflexionswinkel';
  data.symbol[9] := 'α''';
  data.&unit[9] := '°';
  data.value[10] := 'Brechungswinkel';
  data.symbol[10] := 'β';
  data.&unit[10] := '°';
  data.value[11] := 'Brennweite';
  data.symbol[11] := 'f';
  data.&unit[11] := 'm';
  data.value[12] := 'Gewichtskraft';
  data.symbol[12] := 'F';
  data.&unit[12] := 'N';
  data.value[13] := 'Ortsfaktor';
  data.symbol[13] := 'g';
  data.&unit[13] := 'm/s²';
  data.value[14] := 'Energie';
  data.symbol[14] := 'E';
  data.&unit[14] := 'J';
  data.value[15] := 'Arbeit';
  data.symbol[15] := 'W';
  data.&unit[15] := 'J';
  data.value[16] := 'Leistung';
  data.symbol[16] := 'P';
  data.&unit[16] := 'W';
  data.value[17] := 'Wirkungsgrad';
  data.symbol[17] := 'η';
  data.&unit[17] := '1';
  data.value[18] := 'Stromstärke';
  data.symbol[18] := 'I';
  data.&unit[18] := 'A';
  data.value[19] := 'Spannung';
  data.symbol[19] := 'U';
  data.&unit[19] := 'V';
  data.value[20] := 'Widerstand';
  data.symbol[20] := 'R';
  data.&unit[20] := 'Ω';
  data.value[21] := 'Wärme';
  data.symbol[21] := 'Q';
  data.&unit[21] := 'J';
  data.value[22] := 'spez. Wärmekapazität';
  data.symbol[22] := 'c';
  data.&unit[22] := 'kJ/(kg*K)';
  data.value[23] := 'Temperaturänderung';
  data.symbol[23] := 'ΔT';
  data.&unit[23] := 'K';
  data.value[24] := 'spez. Umwandlungswärme';
  data.symbol[24] := 'q';
  data.&unit[24] := 'kJ/kg';
  data.value[25] := 'Druck';
  data.symbol[25] := 'p';
  data.&unit[25] := 'Pa';
  data.value[26] := 'Ladung';
  data.symbol[26] := 'Q';
  data.&unit[26] := 'C';
  data.value[27] := 'Fläche';
  data.symbol[27] := 'A';
  data.&unit[27] := 'm²';
  data.value[28] := 'Radius';
  data.symbol[28] := 'r';
  data.&unit[28] := 'm';
  data.value[29] := 'Windungszahl';
  data.symbol[29] := 'N';
  data.&unit[29] := '1';
  data.value[30] := 'Beschleunigung';
  data.symbol[30] := 'a';
  data.&unit[30] := 'm/s²';
  data.value[31] := 'Umlaufdauer';
  data.symbol[31] := 'T';
  data.&unit[31] := 's';
  data.value[32] := 'Frequenz';
  data.symbol[32] := 'f';
  data.&unit[32] := 'Hz;1/s';
end;

procedure TForm2.BtnAuswertungClick(Sender: TObject);
var i, count: integer;
    maskEdit: TMaskEdit;
begin
  Form2.Height := Form2.Height + 150;
  Form2.Position := TPosition(poDesktopCenter);

  timer.Enabled := False;
  BtnAuswertung.Enabled := False;
  BtnBeenden.Enabled := True;
  BtnWiederholen.Enabled := True;
  BtnWiederholen.SetFocus;

  count := 0;
  for i := 0 to Form2.ControlCount - 1 do
  begin
    if count >= 20 then
       break;

    if Form2.Controls[i] is TMaskEdit then
    begin
     Inc(count);
     maskEdit := TMaskEdit(Form2.Controls[i]);
     maskEdit.ReadOnly := True;

     if count <= 10 then
     begin
      if maskEdit.Text = data.symbol[used[count]] then
      begin
         Inc(points);
         maskEdit.Font.Color := clGreen;
      end
      else
      begin
         maskEdit.Font.Color := clRed;
         maskEdit.MaxLength := 0;
         maskEdit.Text := maskEdit.Text + ' ➔ ' + data.symbol[used[count]];
      end;
     end
     else if count > 10 then
     begin
      if (maskEdit.Text <> '') and ((maskEdit.Text = data.&unit[used[count-10]]) or (data.&unit[used[count-10]].split(';')[0] = maskEdit.Text) or (data.&unit[used[count-10]].split(';')[1] = maskEdit.Text)) then
      begin
         Inc(points);
         maskEdit.Font.Color := clGreen;
      end
      else
      begin
         maskEdit.Font.Color := clRed;
         maskEdit.MaxLength := 0;
         maskEdit.Text := maskEdit.Text + ' ➔ ' + data.&unit[used[count-10]];
      end;
     end;
    end;

  end;

  LblPunkte.Caption := 'Punkte: ' + inttostr(points) + '/20';
  case points of
   18..20: LblNote.Caption := 'Note: 1';
   14..17: LblNote.Caption := 'Note: 2';
   10..13: LblNote.Caption := 'Note: 3';
   6..9: LblNote.Caption := 'Note: 4';
   2..5: LblNote.Caption := 'Note: 5';
   0..1: LblNote.Caption := 'Note: 6';
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
var r, i, j: Integer;
begin
     randomize;

     MaskEdit1.SetFocus;

     // Array mit -1 ausfüllen
     for i := 0 to High(used) do
       used[i] := -1;

     // Timerdauer festlegen
     timeLeft := multiplier * 30;

     // Timer starten und die Anzeige aktualisieren
     timer.enabled := True;
     updateTimerDisplay;

     // Zufällige Zahl bestimmt welche Aufgabe gestellt wird
     i := 1;
     repeat
       r := random(maxIdx+1);
       if not ArrayContains(used, r) then
         begin
          used[i] := r;

          // Jedes Steuerelement im Loop durchlaufen
          for j := 0 to Form2.ControlCount - 1 do
          begin
            // Prüfen, ob das Steuerelement ein TLabel ist und leer ist
            if (Form2.Controls[j] is TLabel) and (TLabel(Form2.Controls[j]).Caption = '') then
            begin
              // Physikalische Größe zuweisen
              TLabel(Form2.Controls[j]).Caption := data.value[r];
              Inc(i);
              Break; // Loop vorzeitig beenden
            end;
          end;
         end;
     until used[10] <> -1; // Solange wiederholen, bis alle Felder gefüllt sind
end;

procedure TForm2.KeyPress(Sender: TObject; var Key: char);
begin
     if Key = ' ' then
        Key := #0; // Verbietet ein Leerzeichen einzutippen
end;

procedure TForm2.KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  maskEdit: TEdit;
begin
     maskEdit := TEdit(Sender);

     // Wenn folgende Wörter eingetippt werden, werden sie
     // mit dem entsprechendem gr. Buchtaben ersetzt
     case Lowercase(maskEdit.Text) of
      'alpha': maskEdit.Text := 'α';
      'beta': maskEdit.Text := 'β';
      'delta': maskEdit.Text := 'Δ';
      'eta': maskEdit.Text := 'η';
      'rho': maskEdit.Text := 'ρ';
      'omega', 'ohm': maskEdit.Text := 'Ω';
      else
        Exit;
     end;

     // Den Cursor ans Ende setzten
     maskEdit.SelStart := Length(maskEdit.Text);
end;

procedure TForm2.updateTimerDisplay;
begin
     LblTimer.Caption := IntToStr(timeLeft);
end;

procedure TForm2.timerTimer(Sender: TObject);
begin
     // Eine Sekunde abziehen
     Dec(timeLeft);

     // Timer aktualisieren
     updateTimerDisplay;

     // Überprüden, ob die Zeit abgelaufen ist
     if timeLeft = 0 then
     begin
        timer.Enabled := False;
        btnAuswertung.Click;
     end;
end;

function TForm2.ArrayContains(const Arr: array of integer; Value: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Low(Arr) to High(Arr) do // 1, 2, 3, 4, 5
  begin                             // [3, 2, 4, 1, 5]
    if Arr[i] = Value then
    begin
      Result := True;
      Exit; // Prozedur vorzeitig beenden, wenn der Wert gefunden wurde
    end;
  end;
end;

procedure TForm2.BtnBeendenClick(Sender: TObject);
var i: integer;
begin
  Form2.Height := 720;
  points := 0;
  btnAuswertung.Enabled := True;
  BtnBeenden.Enabled := False;
  BtnWiederholen.Enabled := False;

  for i := 0 to Form2.ControlCount - 1 do
  begin
    if (Form2.Controls[i] is TLabel) and (TLabel(Form2.Controls[i]).Tag <> 1) then
    begin
       TLabel(Form2.Controls[i]).Caption := ''
    end
    else if Form2.Controls[i] is TMaskEdit then
    begin
     TMaskEdit(Form2.Controls[i]).Text := '';
     TMaskEdit(Form2.Controls[i]).MaxLength := 7;
     TMaskEdit(Form2.Controls[i]).ReadOnly := False;
     TMaskEdit(Form2.Controls[i]).Enabled := True;
     TMaskEdit(Form2.Controls[i]).Font.Color := clDefault;
    end;
  end;

  Self.Close;
  Form1.Show;
end;

procedure TForm2.BtnWiederholenClick(Sender: TObject);
var i: integer;
begin
  Form2.Height := 720;
  points := 0;
  btnAuswertung.Enabled := True;
  BtnBeenden.Enabled := False;
  BtnWiederholen.Enabled := False;

  for i := 0 to Form2.ControlCount - 1 do
  begin
    if (Form2.Controls[i] is TLabel) and (TLabel(Form2.Controls[i]).Tag <> 1) then
    begin
       TLabel(Form2.Controls[i]).Caption := ''
    end
    else if Form2.Controls[i] is TMaskEdit then
    begin
       TMaskEdit(Form2.Controls[i]).Text := '';
       TMaskEdit(Form2.Controls[i]).MaxLength := 7;
       TMaskEdit(Form2.Controls[i]).ReadOnly := False;
       TMaskEdit(Form2.Controls[i]).Enabled := True;
       TMaskEdit(Form2.Controls[i]).Font.Color := clDefault;
    end;
  end;

  Form2.Hide;
  Form2.Show;
end;

end.

