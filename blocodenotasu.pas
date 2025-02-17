unit blocoDeNotasU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtDlgs, PrintersDlgs, Printers;

type

  { TForm1 }

  TForm1 = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    menuArq: TMenuItem;
    menuAbrir: TMenuItem;
    menuImprimir: TMenuItem;
    menuEditar: TMenuItem;
    menuFormatF: TMenuItem;
    menuSair: TMenuItem;
    menuSubstituir: TMenuItem;
    menuLocalizar: TMenuItem;
    menuSalvar: TMenuItem;
    menuNovo: TMenuItem;
    OpenDialog1: TOpenDialog;
    PrintDialog1: TPrintDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    procedure FindDialog1Find(Sender: TObject);
    procedure FontDialog1Close(Sender: TObject);
    procedure menuAbrirClick(Sender: TObject);
    procedure menuFormatFClick(Sender: TObject);
    procedure menuImprimirClick(Sender: TObject);
    procedure menuLocalizarClick(Sender: TObject);
    procedure menuNovoClick(Sender: TObject);
    procedure menuSairClick(Sender: TObject);
    procedure menuSalvarClick(Sender: TObject);
    procedure PrintDialog1Close(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  resposta: integer;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.menuLocalizarClick(Sender: TObject);
begin
  FindDialog1.Execute;
end;

procedure TForm1.menuAbrirClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.menuFormatFClick(Sender: TObject);
begin
  FontDialog1.Execute;
end;

procedure TForm1.menuImprimirClick(Sender: TObject);
var
  i: integer;
begin
  PrintDialog1.Execute;

    Printer.BeginDoc;
    for i := 0 to Memo1.Lines.Count - 1 do
    begin
      Printer.Canvas.TextOut(100, 100 + (i * 20), Memo1.Lines[i]);
    end;
    Printer.EndDoc;
end;

procedure TForm1.FontDialog1Close(Sender: TObject);
begin
  Memo1.Font.Name := FontDialog1.Font.Name;
  Memo1.font.size := FontDialog1.font.size;
  Memo1.Font.style := FontDialog1.font.Style;
  Memo1.font.color := FontDialog1.font.color;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
var
  posicao, selecao: integer;
begin
  selecao := Memo1.SelStart + Memo1.SelLength;
  posicao := Pos(FindDialog1.FindText, Copy(memo1.Text, selecao + 1,
    Length(Memo1.Text) - selecao));
  if posicao > 0 then
  begin
    posicao := posicao + selecao;
    Memo1.selstart := posicao - 1;
    Memo1.SelLength := Length(FindDialog1.Findtext);
  end
  else
    ShowMessage('Texto não encontrado');
end;

procedure TForm1.menuNovoClick(Sender: TObject);
begin
  resposta := MessageDlg('Quer começar um arquivo novo?', mtConfirmation,
    [mbYes, mbNo], 0);
  if resposta = mrYes then
    Memo1.Clear
  else
    Exit;
end;

procedure TForm1.menuSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.menuSalvarClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile(SaveDialog1.Filename);
end;

procedure TForm1.PrintDialog1Close(Sender: TObject);
begin
  ShowMessage(PrintDialog1.UserChoice);
end;



end.
