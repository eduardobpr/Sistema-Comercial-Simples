unit UdtmFornecedores;

interface

uses
  SysUtils, Classes, FMTBcd, SqlExpr, Provider, DB, DBClient;

type
  TDtmFornecedores = class(TDataModule)
    ClientDataSet1: TClientDataSet;
    DspProvider: TDataSetProvider;
    QryFornecedor: TSQLQuery;
    DspForCod: TDataSetProvider;
    CdsForCod: TClientDataSet;
    DSCodigo: TDataSource;
    DataSource1: TDataSource;
    ClientDataSet1CODIGO: TIntegerField;
    ClientDataSet1RAZAO: TStringField;
    ClientDataSet1CIDADE: TStringField;
    ClientDataSet1UF: TStringField;
    ClientDataSet1TELEFONE: TStringField;
    ClientDataSet1CNPJ: TStringField;
    ClientDataSet1ENDERECO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmFornecedores: TDtmFornecedores;

implementation

{$R *.dfm}

end.
