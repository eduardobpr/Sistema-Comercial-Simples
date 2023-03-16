program Sistema;

uses
  Forms,
  SysUtils,
  USplash in 'USplash.pas' {FrmSplash},
  UfrmLogin in 'UfrmLogin.pas' {FrmLogin},
  UdtmGeral in 'UdtmGeral.pas' {DtmGeral: TDataModule},
  UFrmFornecedor in 'UFrmFornecedor.pas' {FrmFornecedor},
  UdtmFornecedores in 'UdtmFornecedores.pas' {DtmFornecedores: TDataModule},
  UFrmClientes in 'UFrmClientes.pas' {FrmClientes},
  UdtmClientes in 'UdtmClientes.pas' {DtmClientes: TDataModule},
  UdtmFuncionarios in 'UdtmFuncionarios.pas' {DtmFuncionarios: TDataModule},
  UFrmFuncionarios in 'UFrmFuncionarios.pas' {FrmFuncionarios},
  UfrmMenuPrinc in 'UfrmMenuPrinc.pas' {FrmMenuPrinc},
  UFrmProdutos in 'UFrmProdutos.pas' {FrmProdutos},
  UdtmProdutos in 'UdtmProdutos.pas' {DtmProdutos: TDataModule},
  UfrmVendas in 'UfrmVendas.pas' {FrmVendas},
  UdtmVendas in 'UdtmVendas.pas' {DtmVendas: TDataModule},
  UfrmRelatorioVendas in 'UfrmRelatorioVendas.pas' {FrmRelVendas},
  UfrmRelatorioProdutos in 'UfrmRelatorioProdutos.pas' {FrmRelProd};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sistema Comercial 1.0';
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmMenuPrinc, FrmMenuPrinc);
  Application.CreateForm(TFrmSplash, FrmSplash);
  FrmSplash.Show;
  FrmSplash.refresh;
  Sleep(2000);
  FrmSplash.release;
  FrmSplash:= nil;



  Application.CreateForm(TDtmGeral, DtmGeral);

  Application.CreateForm(TFrmFornecedor, FrmFornecedor);
  Application.CreateForm(TDtmFornecedores, DtmFornecedores);
  Application.CreateForm(TDtmFuncionarios, DtmFuncionarios);
  Application.CreateForm(TFrmFuncionarios, FrmFuncionarios);
  Application.CreateForm(TDtmProdutos, DtmProdutos);
  Application.CreateForm(TFrmProdutos, FrmProdutos);
  Application.CreateForm(TDtmVendas, DtmVendas);
  Application.CreateForm(TFrmVendas, FrmVendas);
  Application.CreateForm(TFrmRelVendas, FrmRelVendas);
  Application.CreateForm(TFrmRelProd, FrmRelProd);
  Application.CreateForm(TFrmClientes,FrmClientes);
  Application.CreateForm(TDtmClientes,DtmClientes);

  Application.Run;
end.
