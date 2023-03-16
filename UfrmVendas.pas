unit UfrmVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TFrmVendas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EdtPesquisa: TEdit;
    BtnPesquisa: TBitBtn;
    BtnAdicionar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnEditar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    Label1: TLabel;
    EdtCodVenda: TEdit;
    Label2: TLabel;
    EdtDataVenda: TEdit;
    Label3: TLabel;
    EdtValorProduto: TEdit;
    Label4: TLabel;
    EdtQuantidade: TEdit;
    Label5: TLabel;
    EdtCliente: TEdit;
    Label6: TLabel;
    EdtDesconto: TEdit;
    Label7: TLabel;
    EdtAcrescimo: TEdit;
    Label8: TLabel;
    EdtFrete: TEdit;
    BtnAlteracoes: TBitBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnAlteracoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendas: TFrmVendas;

implementation

uses UdtmVendas;

{$R *.dfm}

procedure TFrmVendas.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendas.BtnCancelarClick(Sender: TObject);
begin
  dtmvendas.cdsvendas.cancel;
end;

procedure TFrmVendas.BtnExcluirClick(Sender: TObject);
begin
  dtmvendas.cdsvendas.delete;
end;

procedure TFrmVendas.BtnGravarClick(Sender: TObject);
begin
  dtmvendas.cdsvendas.post;
  DtmVendas.CdsVendas.ApplyUpdates(0);
end;

procedure TFrmVendas.BtnEditarClick(Sender: TObject);
begin
  DtmVendas.CdsVendas.Edit;
  edtcodvenda.Text:=DtmVendas.CdsVendas.FieldByName('COD VENDA').AsString;
  edtdatavenda.Text:=DtmVendas.CdsVendas.FieldByName('DATA VENDA').AsString;
  edtvalorproduto.Text:=DtmVendas.CdsVendas.FieldByName('VALOR PRODUTO').AsString;
  edtquantidade.Text:=DtmVendas.CdsVendas.FieldByName('QUANTIDADE').AsString;
  edtcliente.Text:=DtmVendas.CdsVendas.FieldByName('CLIENTE').AsString;
  edtdesconto.Text:=DtmVendas.CdsVendas.FieldByName('DESCONTO').AsString;
  edtacrescimo.Text:=DtmVendas.CdsVendas.FieldByName('ACRESCIMO').AsString;
  edtfrete.Text:=DtmVendas.CdsVendas.FieldByName('FRETE').AsString;
end;

procedure TFrmVendas.BtnAdicionarClick(Sender: TObject);
begin
if trim(edtdatavenda.text) = '' then
    begin
    edtdatavenda.setfocus;
    raise exception.create('Entre com a data da venda');
    end;

	if trim(edtvalorproduto.text) = '' then
    	begin
    	edtvalorproduto.setfocus;
    	raise exception.create('Entre com o valor do produto');
    	end;

  		if trim(edtquantidade.text) = '' then
    		begin
    		edtquantidade.setfocus;
    		raise exception.create('Entre com a quantidade');
		    end;

  			    if trim(edtcliente.text) = '' then
    			    begin
    			      edtcliente.setfocus;
    			      raise exception.create('Entre com o cliente');
              end;

  DtmVendas.CdsVendas.Insert;
  dtmvendas.CdsVendasCODVENDA.AsString := edtcodvenda.text;
  dtmvendas.CdsVendasDATAVENDA.AsString := edtdatavenda.text;
  dtmvendas.CdsVendasVALORPRODUTO.AsString := edtvalorproduto.text;
  dtmvendas.CdsVendasQUANTIDADE.AsString := edtquantidade.text;
  dtmvendas.CdsVendasCLIENTE.AsString := edtcliente.text;
  dtmvendas.CdsVendasDESCONTO.AsString := edtdesconto.text;
  dtmvendas.CdsVendasACRESCIMO.AsString := edtacrescimo.text;
  dtmvendas.CdsVendasFRETE.AsString := edtfrete.text;
  DtmVendas.CdsVendas.Post;

  if DtmVendas.CdsVendas.ApplyUpdates(0) = 0 then
     begin
        ShowMessage('Dados Adicionados com sucesso!');
        edtcodvenda.Text := '';
        edtdatavenda.Text := '';
        edtvalorproduto.Text := '';
        edtquantidade.Text := '';
        edtcliente.Text := '';
        edtdesconto.Text := '';
        edtacrescimo.Text := '';
        edtfrete.Text := '';

        Dtmvendas.Cdsvencod.Close;
        Dtmvendas.Cdsvencod.CommandText := 'SELECT MAX(CODVENDA)+1 AS COD FROM VENDA';
        Dtmvendas.Cdsvencod.Open;
        edtCodvenda.Text := IntToStr(Dtmvendas.Cdsvencod.FieldByName('COD').AsInteger);

        Exit;
        end
          else
            begin
            ShowMessage('Erro ao Adicionar as informacoes dados!');
            Exit;
            end;


end;

procedure TFrmVendas.BtnAlteracoesClick(Sender: TObject);
begin
  DtmVendas.CdsVendas.Insert;
  dtmvendas.CdsVendasCODVENDA.AsString := edtcodvenda.text;
  dtmvendas.CdsVendasDATAVENDA.AsString := edtdatavenda.text;
  dtmvendas.CdsVendasVALORPRODUTO.AsString := edtvalorproduto.text;
  dtmvendas.CdsVendasQUANTIDADE.AsString := edtquantidade.text;
  dtmvendas.CdsVendasCLIENTE.AsString := edtcliente.text;
  dtmvendas.CdsVendasDESCONTO.AsString := edtdesconto.text;
  dtmvendas.CdsVendasACRESCIMO.AsString := edtacrescimo.text;
  dtmvendas.CdsVendasFRETE.AsString := edtfrete.text;
  DtmVendas.CdsVendas.Post;

  if DtmVendas.CdsVendas.ApplyUpdates(0) = 0 then
     begin
        ShowMessage('Dados Adicionados com sucesso!');
        edtcodvenda.Text := '';
        edtdatavenda.Text := '';
        edtvalorproduto.Text := '';
        edtquantidade.Text := '';
        edtcliente.Text := '';
        edtdesconto.Text := '';
        edtacrescimo.Text := '';
        edtfrete.Text := '';

        Dtmvendas.Cdsvencod.Close;
        Dtmvendas.Cdsvencod.CommandText := 'SELECT MAX(CODVENDA)+1 AS COD FROM VENDA';
        Dtmvendas.Cdsvencod.Open;
        edtCodvenda.Text := IntToStr(Dtmvendas.Cdsvencod.FieldByName('COD').AsInteger);
        Exit;
        
        end
          else
            begin
            ShowMessage('Erro ao Adicionar as informacoes dados!');
            Exit;
            end;


end;


procedure TFrmVendas.FormShow(Sender: TObject);
begin
  Dtmvendas.Cdsvencod.Close;
  Dtmvendas.Cdsvencod.CommandText := 'SELECT MAX(CODVENDA)+1 AS COD FROM VENDA';
  Dtmvendas.Cdsvencod.Open;
  edtCodvenda.Text := IntToStr(Dtmvendas.Cdsvencod.FieldByName('COD').AsInteger);
  Exit;
  
end;

procedure TFrmVendas.BtnPesquisaClick(Sender: TObject);
begin
  DtmVendas.CdsVendas.Filter := 'upper(CLIENTE) Like'+#39+uppercase(edtpesquisa.text)+'%'+#39;
  DtmVendas.CdsVendas.Filtered := true;
end;

end.
