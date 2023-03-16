unit UfrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, DBXpress, DB, SqlExpr, FMTBcd;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Usuario: TLabel;
    Senha: TLabel;
    TxtUsu: TEdit;
    TxtSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses UdtmGeral, UfrmMenuPrinc;

{$R *.dfm}

procedure TFrmLogin.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);

var
usu,senha: String;

begin
usu := trim(txtUsu.text);
senha := trim(txtsenha.text);

  if ( usu = '') then
  begin
    Raise exception.Create ('Entre com o Usuario');
    TxtUsu.SetFocus;
  end
      else
      if ( senha = '') then
        begin
          Raise exception.Create ('Entre com o Senha');
          TxtSenha.SetFocus;
         end

            else

              begin
              DtmGeral.SQLConnection1.Close;
              DtmGeral.SQLConnection1.Params.Clear;


              DtmGeral.SQLConnection1.Params.Add('Database=localhost:c:\Sistema.fdb');
              DtmGeral.SQLConnection1.Params.Add('RoleName=');
              DtmGeral.SQLConnection1.Params.Add('User_Name='+usu);
              DtmGeral.SQLConnection1.Params.Add('Password='+senha);
              DtmGeral.SQLConnection1.Params.Add('ServerCharSet=ISO8859_1');
              DtmGeral.SQLConnection1.Params.Add('SQLDialect=1');
              DtmGeral.SQLConnection1.Params.Add ('BlobSize=-1');
              DtmGeral.SQLConnection1.Params.Add('CommitRetain=False');
              DtmGeral.SQLConnection1.Params.Add('WaitOnLocks=True');
              DtmGeral.SQLConnection1.Params.Add('ErrorResourceFile=');
              DtmGeral.SQLConnection1.Params.Add('LocaleCode=0000');
              DtmGeral.SQLConnection1.Params.Add('Interbase TransIsolation=ReadCommited');
              DtmGeral.SQLConnection1.Params.Add('Trim Char=False');
              DtmGeral.SQLConnection1.Open;
              FrmLogin.Destroy;
              FrmMenuPrinc.ShowModal;
              end;


end;


end.
