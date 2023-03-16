unit UFrmFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids, DBGrids, DB, DBClient;

type
  TFrmFornecedor = class(TForm)
    Panel1: TPanel;
    BtnAdicionar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnEditar: TBitBtn;
    BtnSair: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edtRazao: TEdit;
    Label2: TLabel;
    edtCidade: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtUF: TEdit;
    Label6: TLabel;
    edtEndereco: TEdit;
    Panel2: TPanel;
    EdtPesquisa: TEdit;
    BtnPesquisa: TBitBtn;
    edtCNPJ: TEdit;
    edtTelefone: TEdit;
    BtnAlteracoes: TBitBtn;
    Label7: TLabel;
    EdtCodigo: TEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnAlteracoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    
  private
    { Private declarations }
  public

  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

uses UdtmFornecedores;

{$R *.dfm}

procedure TFrmFornecedor.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFornecedor.BtnAdicionarClick(Sender: TObject);
begin

if trim(edtrazao.text) = '' then
    begin
    edtrazao.setfocus;
    raise exception.create('Entre com a Razao Social');
    end;

	if trim(edtcidade.text) = '' then
    	begin
    	edtcidade.setfocus;
    	raise exception.create('Entre com a Cidade do fornecedor');
    	end;

  		if trim(edtendereco.text) = '' then
    		begin
    		edtendereco.setfocus;
    		raise exception.create('Entre com o Endereco');
		    end;

  			    if trim(edtcnpj.text) = '' then
    			    begin
    			      edtcnpj.setfocus;
    			      raise exception.create('Entre com o CNPJ');
              end;

    		          if trim(edtuf.text) = '' then
    		          begin
    		          edtuf.setfocus;
    		          raise exception.create('Entre com o UF do ESTADO');
    		          end;

                      if trim(edttelefone.text) = '' then
    		              begin
    		              edttelefone.setfocus;
    		              raise exception.create('Entre com o Telefone');
                      end;


  dtmfornecedores.ClientDataSet1.Insert;
  dtmfornecedores.ClientDataSet1CODIGO.AsString := edtcodigo.Text;
  dtmfornecedores.ClientDataSet1RAZAO.AsString := edtRazao.Text;
  dtmfornecedores.ClientDataSet1CIDADE.AsString := edtCidade.Text;
  dtmfornecedores.ClientDataSet1ENDERECO.AsString := edtEndereco.Text;
  dtmfornecedores.ClientDataSet1UF.AsString := edtuf.Text;
  dtmfornecedores.ClientDataSet1CNPJ.AsString := edtCnpj.Text;
  dtmfornecedores.ClientDataSet1TELEFONE.AsString := edtTelefone.Text;
  dtmfornecedores.ClientDataSet1.Post;

    if dtmfornecedores.ClientDataSet1.ApplyUpdates(0) = 0 then
        begin
        ShowMessage('Dados Adicionados com sucesso!');
        edtcodigo.Text := '';
        edtRazao.Text := '';
        edtCidade.Text := '';
        edtUF.Text := '';
        edtEndereco.Text := '';
        edtCNPJ.Text := '';
        edtTelefone.Text := '';

        DtmFornecedores.CdsForCod.Close;
        DtmFornecedores.CdsForCod.CommandText := 'SELECT MAX(CODIGO)+1 AS COD FROM FORNECEDORES';
        DtmFornecedores.CdsForCod.Open;
        edtCodigo.Text := IntToStr(DtmFornecedores.CdsForCod.FieldByName('COD').AsInteger);

        Exit;
        end
          else
            begin
            ShowMessage('Erro ao Adicionar as informacoes dados!');
            Exit;
            end;



end;

procedure TFrmFornecedor.BtnGravarClick(Sender: TObject);
begin
  DtmFornecedores.ClientDataSet1.Post;
  DtmFornecedores.ClientDataSet1.ApplyUpdates(0);
end;

procedure TFrmFornecedor.BtnCancelarClick(Sender: TObject);
begin
  dtmfornecedores.ClientDataSet1.Cancel;
end;

procedure TFrmFornecedor.BtnExcluirClick(Sender: TObject);
begin
  dtmfornecedores.ClientDataSet1.delete;
end;

procedure TFrmFornecedor.BtnEditarClick(Sender: TObject);
begin
  dtmfornecedores.ClientDataSet1.Edit;
  edtcodigo.Text:=DtmFornecedores.ClientDataSet1.FieldByName('CODIGO').AsString;
  edtRazao.text:= dtmfornecedores.ClientDataSet1.FieldByName('RAZAO').AsString;
  edtCidade.text:= dtmfornecedores.ClientDataSet1.FieldByName('CIDADE').AsString;
  edtEndereco.text:= dtmfornecedores.ClientDataSet1.FieldByName('ENDERECO').AsString;
  edtUF.text:= dtmfornecedores.ClientDataSet1.FieldByName('UF').AsString;
  EdtCNPJ.Text:= dtmfornecedores.ClientDataSet1.FieldByName('CNPJ').AsString;
  EdtTelefone.Text:= dtmfornecedores.ClientDataSet1.FieldByName('TELEFONE').AsString;
end;

procedure TFrmFornecedor.BtnAlteracoesClick(Sender: TObject);
begin
  dtmfornecedores.ClientDataSet1.Insert;
  dtmfornecedores.ClientDataSet1RAZAO.AsString := edtRazao.Text;
  dtmfornecedores.ClientDataSet1CIDADE.AsString := edtCidade.Text;
  dtmfornecedores.ClientDataSet1ENDERECO.AsString := edtEndereco.Text;
  dtmfornecedores.ClientDataSet1UF.AsString := edtuf.Text;
  dtmfornecedores.ClientDataSet1CNPJ.AsString := edtCnpj.Text;
  dtmfornecedores.ClientDataSet1TELEFONE.AsString := edtTelefone.Text;
  dtmfornecedores.ClientDataSet1.Post;
  if dtmfornecedores.ClientDataSet1.ApplyUpdates(0) = 0 then
  begin
    ShowMessage('Dados gravados com sucesso!');
    EdtCodigo.text := '';
    edtRazao.Text := '';
    edtCidade.Text := '';
    edtUF.Text := '';
    edtEndereco.Text := '';
    edtCNPJ.Text := '';
    edtTelefone.Text := '';

    DtmFornecedores.CdsForCod.Close;
    DtmFornecedores.CdsForCod.CommandText := 'SELECT MAX(CODIGO)+1 AS COD FROM FORNECEDORES';
    DtmFornecedores.CdsForCod.Open;
    edtCodigo.Text := IntToStr(DtmFornecedores.CdsForCod.FieldByName('COD').AsInteger);
    Exit;
  end
  else
  begin
    ShowMessage('Erro ao gravar dados!');
    Exit;
  end;
end;

procedure TFrmFornecedor.FormShow(Sender: TObject);
begin
  DtmFornecedores.CdsForCod.Close;
  DtmFornecedores.CdsForCod.CommandText := 'SELECT MAX(CODIGO)+1 AS COD FROM FORNECEDORES';
  DtmFornecedores.CdsForCod.Open;
  edtCodigo.Text := IntToStr(DtmFornecedores.CdsForCod.FieldByName('COD').AsInteger);
end;

procedure TFrmFornecedor.BtnPesquisaClick(Sender: TObject);
begin
  DtmFornecedores.ClientDataSet1.Filter := 'upper(RAZAO) Like'+#39+uppercase(edtpesquisa.text)+'%'+#39;
  DtmFornecedores.ClientDataSet1.Filtered := true;
end;

end.
