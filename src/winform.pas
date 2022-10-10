// ----------------------------------------------------------------------------
// Delphi-Programm für die Berechnung von Cantor's Diagonal:
// Ausdruck := (((m + n - 1) * (m + n - 2)) / 2) + m;
//
// (c) 2022 paule32 <paule32.jk@gmail.com>
// nur für schulische Zwecke !!!
//
// Übersetzt mit Delphi7 2002 - 32 Bit
// unter: Windows 11 64-Bit-
// ----------------------------------------------------------------------------
unit winform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    ListBox1: TListBox;
    StringGrid1: TStringGrid;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  m, n: Integer;
  Ausdruck: Double;
begin
  try
    try
      StringGrid1.ColCount := StrToInt(Trim(Edit1.Text)) + 2;
      StringGrid1.RowCount := StrToInt(Trim(Edit2.Text)) + 2;

      ListBox1.Items.Clear;

      for m := 1 to StringGrid1.ColCount do
      begin
        for n := 1 to StringGrid1.RowCount do
        begin
          Ausdruck := (((m + n - 1) * (m + n - 2)) / 2) + m;

          with StringGrid1 do
          begin
            Cells[n, m] := FloatToStr(Ausdruck);
            Cells[n, 0] := IntToStr(n);
            Cells[0, m] := IntToStr(m);
          end;

          ListBox1.Items.Add('k(' +
          IntToStr(m) + ', '      +
          IntToStr(n) + ') = '    + FloatToStr(Ausdruck));
        end;
      end;
    except
      ShowMessage('Fehler eingetretten.');
    end;
  finally
  end
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0, 0] := 'm / n';
end;

end.
