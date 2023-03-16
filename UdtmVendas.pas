unit UdtmVendas;

interface

uses
  SysUtils, Classes, FMTBcd, SqlExpr, DB, Provider, DBClient;

type
  TDtmVendas = class(TDataModule)
    CdsVendas: TClientDataSet;
    DspVendas: TDataSetProvider;
    DSVendas: TDataSource;
    QryVendas: TSQLQuery;
    CdsVendasCODVENDA: TIntegerField;
    CdsVendasDATAVENDA: TStringField;
    CdsVendasVALORPRODUTO: TFloatField;
    CdsVendasQUANTIDADE: TIntegerField;
    CdsVendasCLIENTE: TStringField;
    CdsVendasDESCONTO: TFloatField;
    CdsVendasACRESCIMO: TFloatField;
    CdsVendasFRETE: TFloatField;
    CdsVenCod: TClientDataSet;
    DspVenCod: TDataSetProvider;
    DSvencod: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmVendas: TDtmVendas;

implementation

{$R *.dfm}


end.
