unit blocoDeNotasU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  PrintersDlgs;

type

  { TForm1 }

  TForm1 = class(TForm)
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    menuArq: TMenuItem;
    menuAbrir: TMenuItem;
    menuImprimir: TMenuItem;
    menuEditar: TMenuItem;
    menuFormatF: TMenuItem;
    menuSubstituir: TMenuItem;
    menuLocalizar: TMenuItem;
    menuSalvar: TMenuItem;
    menuNovo: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageSetupDialog1: TPageSetupDialog;
    SaveDialog1: TSaveDialog;
    procedure menuAbrirClick(Sender: TObject);
    procedure menuLocalizarClick(Sender: TObject);
    procedure menuNovoClick(Sender: TObject);
    procedure menuSalvarClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.menuLocalizarClick(Sender: TObject);
begin

end;

procedure TForm1.menuAbrirClick(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TForm1.menuNovoClick(Sender: TObject);
begin
  memo1.clear;
end;

procedure TForm1.menuSalvarClick(Sender: TObject);
begin
  SaveDialog1.execute;
end;

end.

