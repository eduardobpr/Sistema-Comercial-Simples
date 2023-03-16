unit UdtmProdutos;

interface

uses
  SysUtils, Classes, FMTBcd, SqlExpr, DB, Provider, DBClient;

type
  TDtmProdutos = class(TDataModule)
    CdsProdutos: TClientDataSet;
    DspProdutos: TDataSetProvider;
    DsProdutos: TDataSource;
    QryProdutos: TSQLQuery;
    CdsProdCod: TClientDataSet;
    DspProdCod: TDataSetProvider;
    DSprodCod: TDataSource;
    CdsProdutosIDPROD: TIntegerField;
    CdsProdutosCATEGORIA: TStringField;
    CdsProdutosNOME: TStringField;
    CdsProdutosQUANTIDADE: TIntegerField;
    CdsProdutosUNIDADE: TStringField;
    CdsProdutosFORNECEDOR: TStringField;
    CdsProdutosPRECOVENDA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmProdutos: TDtmProdutos;

implementation

{$R *.dfm}

end.
