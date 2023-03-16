unit UfrmMenuPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Menus, jpeg;

type
  TFrmMenuPrinc = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Forncedores1: TMenuItem;
    N1: TMenuItem;
    Clientes1: TMenuItem;
    N2: TMenuItem;
    Funcionarios1: TMenuItem;
    N3: TMenuItem;
    Vendas1: TMenuItem;
    N4: TMenuItem;
    Produtos1: TMenuItem;
    Relatorio1: TMenuItem;
    Vendas2: TMenuItem;
    Sobre1: TMenuItem;
    SistemaComercial1: TMenuItem;
    Produto1: TMenuItem;
    Sair2: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Forncedores1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
    procedure SistemaComercial1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrinc: TFrmMenuPrinc;

implementation

uses UFrmClientes, UFrmFornecedor, UFrmFuncionarios, UFrmProdutos,
  UfrmVendas, UfrmRelatorioVendas, UfrmRelatorioProdutos;

{$R *.dfm}

procedure TFrmMenuPrinc.Timer1Timer(Sender: TObject);
begin
    Statusbar1.Panels [0].Text := ' '+formatdatetime ('dddd","dd" de "mmmm" de "yyyy',now);
    statusbar1.Panels [1].Text := ' '+formatdatetime ('hh:mm:ss',now);
end;

procedure TFrmMenuPrinc.Forncedores1Click(Sender: TObject);
begin
  FrmFornecedor.Showmodal;
end;

procedure TFrmMenuPrinc.Clientes1Click(Sender: TObject);
begin
  FrmClientes.ShowModal;
end;

procedure TFrmMenuPrinc.Funcionarios1Click(Sender: TObject);
begin
  frmfuncionarios.showmodal;
end;

procedure TFrmMenuPrinc.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMenuPrinc.Produtos1Click(Sender: TObject);
begin
  frmprodutos.showmodal;
end;

procedure TFrmMenuPrinc.Vendas1Click(Sender: TObject);
begin
  FrmVendas.ShowModal;
end;

procedure TFrmMenuPrinc.Vendas2Click(Sender: TObject);
begin
  Frmrelvendas.Quickrep1.Preview;
end;

procedure TFrmMenuPrinc.SistemaComercial1Click(Sender: TObject);
begin
  showmessage('Created By Alessandro Martins e Eduardo Benvindo')
end;

procedure TFrmMenuPrinc.Produto1Click(Sender: TObject);
begin
  frmrelprod.QuickRep1.Preview;
end;

procedure TFrmMenuPrinc.Sair2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
