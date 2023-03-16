unit UFrmProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Edtpesquisa: TEdit;
    BtnPesquisa: TBitBtn;
    BtnAdicionar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnEditar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EdtIdProd: TEdit;
    Label2: TLabel;
    EdtCategoria: TEdit;
    Label3: TLabel;
    EdtQuantidade: TEdit;
    Label4: TLabel;
    EdtNome: TEdit;
    Label5: TLabel;
    EdtUnidade: TEdit;
    Label6: TLabel;
    EdtFornecedor: TEdit;
    Label7: TLabel;
    EdtPrecovenda: TEdit;
    BtnAlteracoes: TBitBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAlteracoesClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutos: TFrmProdutos;

implementation

uses UdtmProdutos;

{$R *.dfm}

procedure TFrmProdutos.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProdutos.BtnCancelarClick(Sender: TObject);
begin
  dtmprodutos.cdsprodutos.cancel;
end;

procedure TFrmProdutos.BtnExcluirClick(Sender: TObject);
begin
  dtmprodutos.cdsprodutos.delete;
end;

procedure TFrmProdutos.BtnGravarClick(Sender: TObject);
begin
  dtmprodutos.cdsprodutos.post;
  DtmProdutos.CdsProdutos.ApplyUpdates(0);
end;

procedure TFrmProdutos.BtnEditarClick(Sender: TObject);
begin
  dtmprodutos.cdsprodutos.Edit;
  edtidprod.Text:=dtmprodutos.cdsprodutos.FieldByName('IDPROD').AsString;
  edtcategoria.Text:=dtmprodutos.cdsprodutos.FieldByName('CATEGORIA').AsString;
  edtnome.Text:=dtmprodutos.cdsprodutos.FieldByName('NOME').AsString;
  edtquantidade.Text:=dtmprodutos.cdsprodutos.FieldByName('QUANTIDADE').AsString;
  edtunidade.Text:=dtmprodutos.cdsprodutos.FieldByName('UNIDADE').AsString;
  edtfornecedor.Text:=dtmprodutos.cdsprodutos.FieldByName('FORNECEDOR').AsString;
  edtprecovenda.Text:=dtmprodutos.cdsprodutos.FieldByName('PRECO VENDA').AsString;
end;

procedure TFrmProdutos.BtnAdicionarClick(Sender: TObject);
begin

if trim(edtcategoria.text) = '' then
    begin
    edtcategoria.setfocus;
    raise exception.create('Entre com a categoria do produto');
    end;

	if trim(edtnome.text) = '' then
    	begin
    	edtnome.setfocus;
    	raise exception.create('Entre com o nome do produto');
    	end;

  		if trim(edtquantidade.text) = '' then
    		begin
    		edtquantidade.setfocus;
    		raise exception.create('Entre com a quantidade');
		    end;

  			    if trim(edtfornecedor.text) = '' then
    			    begin
    			      edtfornecedor.setfocus;
    			      raise exception.create('Entre com o fornecedor');
              end;

                  if trim(edtprecovenda.text) = '' then
    			          begin
                      edtprecovenda.setfocus;
    			            raise exception.create('Entre com o preco da venda');
                    end;

  DtmProdutos.CdsProdutos.Edit;
  DtmProdutos.CdsProdutosIDPROD.AsString := edtidprod.Text;
  DtmProdutos.CdsProdutosCATEGORIA.AsString := edtcategoria.Text;
  DtmProdutos.CdsProdutosNOME.AsString := edtnome.Text;
  DtmProdutos.CdsProdutosQUANTIDADE.AsString := edtquantidade.Text;
  DtmProdutos.CdsProdutosUNIDADE.AsString := edtunidade.Text;
  DtmProdutos.CdsProdutosFORNECEDOR.AsString := edtfornecedor.Text;
  DtmProdutos.CdsProdutosPRECOVENDA.AsString := edtprecovenda.Text;
  DtmProdutos.CdsProdutos.Post;
  if DtmProdutos.CdsProdutos.ApplyUpdates(0) = 0 then
  begin
    ShowMessage('Dados gravados com sucesso!');
    Edtidprod.text := '';
    edtcategoria.Text := '';
    edtnome.Text := '';
    edtquantidade.Text := '';
    edtunidade.Text := '';
    edtfornecedor.Text := '';
    edtprecovenda.Text := '';

    DtmProdutos.Cdsprodcod.Close;
    DtmProdutos.Cdsprodcod.CommandText := 'SELECT MAX(IDPROD)+1 AS COD FROM PRODUTOS';
    DtmProdutos.Cdsprodcod.Open;
    edtidprod.Text := IntToStr(DtmProdutos.cdsprodcod.FieldByName('COD').AsInteger);
    Exit;
  end
  else
  begin
    ShowMessage('Erro ao gravar dados!');
    Exit;
  end;
end;


procedure TFrmProdutos.FormShow(Sender: TObject);
begin
    DtmProdutos.Cdsprodcod.Close;
    DtmProdutos.Cdsprodcod.CommandText := 'SELECT MAX(IDPROD)+1 AS COD FROM PRODUTOS';
    DtmProdutos.Cdsprodcod.Open;
    edtidprod.Text := IntToStr(DtmProdutos.cdsprodcod.FieldByName('COD').AsInteger);
    Exit;
end;

procedure TFrmProdutos.BtnAlteracoesClick(Sender: TObject);
begin
  DtmProdutos.CdsProdutos.Edit;
  DtmProdutos.CdsProdutosIDPROD.AsString := edtidprod.Text;
  DtmProdutos.CdsProdutosCATEGORIA.AsString := edtcategoria.Text;
  DtmProdutos.CdsProdutosNOME.AsString := edtnome.Text;
  DtmProdutos.CdsProdutosQUANTIDADE.AsString := edtquantidade.Text;
  DtmProdutos.CdsProdutosUNIDADE.AsString := edtunidade.Text;
  DtmProdutos.CdsProdutosFORNECEDOR.AsString := edtfornecedor.Text;
  DtmProdutos.CdsProdutosPRECOVENDA.AsString := edtprecovenda.Text;
  DtmProdutos.CdsProdutos.Post;
  if DtmProdutos.CdsProdutos.ApplyUpdates(0) = 0 then
  begin
    ShowMessage('Dados gravados com sucesso!');
    Edtidprod.text := '';
    edtcategoria.Text := '';
    edtnome.Text := '';
    edtquantidade.Text := '';
    edtunidade.Text := '';
    edtfornecedor.Text := '';
    edtprecovenda.Text := '';

    DtmProdutos.Cdsprodcod.Close;
    DtmProdutos.Cdsprodcod.CommandText := 'SELECT MAX(IDPROD)+1 AS COD FROM PRODUTOS';
    DtmProdutos.Cdsprodcod.Open;
    edtidprod.Text := IntToStr(DtmProdutos.cdsprodcod.FieldByName('COD').AsInteger);
    Exit;
  end
  else
  begin
    ShowMessage('Erro ao gravar dados!');
    Exit;
  end;
end;

procedure TFrmProdutos.BtnPesquisaClick(Sender: TObject);
begin
  DtmProdutos.CdsProdutos.Filter := 'upper(NOME) Like'+#39+uppercase(edtpesquisa.text)+'%'+#39;
  DtmProdutos.CdsProdutos.Filtered := true;
end;

end.
