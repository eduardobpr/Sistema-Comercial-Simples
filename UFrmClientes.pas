unit UFrmClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB;

type
  TFrmClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EdtPesquisa: TEdit;
    BtnPesquisa: TBitBtn;
    BtnAdiciona: TBitBtn;
    BtnGrava: TBitBtn;
    BtnEditar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    Label1: TLabel;
    EdtCod: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtUF: TEdit;
    Label4: TLabel;
    EdtEndereco: TEdit;
    Label5: TLabel;
    EdtCidade: TEdit;
    Label6: TLabel;
    EdtCEP: TEdit;
    Label7: TLabel;
    EdtTelefone: TEdit;
    Label8: TLabel;
    EdtContato: TEdit;
    Label9: TLabel;
    EdtEMAIL: TEdit;
    BtnSalvarAlteracoes: TBitBtn;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnSalvarAlteracoesClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAdicionaClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClientes : TFrmClientes;

implementation

uses UdtmClientes;

{$R *.dfm}

procedure TFrmClientes.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmClientes.BtnCancelarClick(Sender: TObject);
begin
  DtmClientes.CdsClientes.Cancel;
end;

procedure TFrmClientes.BtnExcluirClick(Sender: TObject);
begin
  DtmClientes.CdsClientes.Delete;
end;

procedure TFrmClientes.BtnGravaClick(Sender: TObject);
begin
  DtmClientes.CdsClientes.Post;
  DtmClientes.CdsClientes.ApplyUpdates(0);
end;

procedure TFrmClientes.BtnSalvarAlteracoesClick(Sender: TObject);
begin
  DtmClientes.CdsClientes.Edit;
  DtmClientes.CdsClientesCODIGO.AsString := EdtCod.Text;
  DtmClientes.CdsClientesNOME.AsString := edtnome.Text;
  DtmClientes.CdsClientesUF.AsString := edtUF.Text;
  DtmClientes.CdsClientesCIDADE.AsString := edtcidade.Text;
  DtmClientes.CdsClientesENDERECO.AsString := edtendereco.Text;
  DtmClientes.CdsClientesCEP.AsString := edtCEP.Text;
  DtmClientes.CdsClientesTELEFONE.AsString := edttelefone.Text;
  DtmClientes.CdsClientesEMAIL.AsString := edtemail.Text;
  DtmClientes.CdsClientesCONTATO.AsString := edtcontato.Text;
  DtmClientes.CdsClientes.Post;
  if DtmClientes.CdsClientes.ApplyUpdates(0)= 0 then
    begin
    ShowMessage('Dados gravados com sucesso!');
    EdtCod.Text := '';
    Edtnome.text := '';
    edtUF.Text := '';
    edtCidade.Text := '';
    edtCEP.Text := '';
    edtEndereco.Text := '';
    edtEmail.Text := '';
    edtTelefone.Text := '';
    EdtContato.Text := '';

    DtmClientes.CdsCod.Close;
    DtmClientes.CdsCod.CommandText := 'SELECT MAX(CODIGO)+1 AS COD FROM CLIENTES';
    DtmClientes.CdsCod.Open;
    edtCod.Text := IntToStr(DtmClientes.CdsCod.FieldByName('COD').AsInteger);
    Exit;
    end
        else
          begin
            ShowMessage('Erro ao gravar dados!');
            Exit;
          end;
end;

procedure TFrmClientes.BtnEditarClick(Sender: TObject);
begin
  DtmClientes.CdsClientes.Edit;
  edtcod.Text := DtmClientes.CdsClientes.fieldbyname('codigo').AsString;
  edtnome.Text := DtmClientes.CdsClientes.fieldbyname('nome').AsString;
  edtuf.Text := DtmClientes.CdsClientes.fieldbyname('UF').AsString;
  edtcidade.Text := DtmClientes.CdsClientes.fieldbyname('cidade').AsString;
  edtendereco.Text := DtmClientes.CdsClientes.fieldbyname('endereco').AsString;
  edtcep.Text := DtmClientes.CdsClientes.fieldbyname('cep').AsString;
  edttelefone.Text := DtmClientes.CdsClientes.fieldbyname('telefone').AsString;
  edtemail.Text := DtmClientes.CdsClientes.fieldbyname('email').AsString;
  edtcontato.Text := DtmClientes.CdsClientes.fieldbyname('contato').AsString;
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
    DtmClientes.CdsCod.Close;
    DtmClientes.CdsCod.CommandText := 'SELECT MAX(CODIGO)+1 AS COD FROM CLIENTES';
    DtmClientes.CdsCod.Open;
    edtCod.Text := IntToStr(DtmClientes.CdsCod.FieldByName('COD').AsInteger);
    Exit;
end;

procedure TFrmClientes.BtnAdicionaClick(Sender: TObject);
begin

if trim(edtnome.text) = '' then
    begin
    edtnome.setfocus;
    raise exception.create('Entre com o nome do cliente');
    end;

	if trim(edtendereco.text) = '' then
    	begin
    	edtendereco.setfocus;
    	raise exception.create('Entre com o endereco');
    	end;

  		if trim(edtuf.text) = '' then
    		begin
    		edtuf.setfocus;
    		raise exception.create('Entre com o estado');
		    end;


  DtmClientes.CdsClientes.Insert;
  DtmClientes.CdsClientesCODIGO.AsString := EdtCod.Text;
  DtmClientes.CdsClientesNOME.AsString := edtnome.Text;
  DtmClientes.CdsClientesUF.AsString := edtUF.Text;
  DtmClientes.CdsClientesCIDADE.AsString := edtcidade.Text;
  DtmClientes.CdsClientesENDERECO.AsString := edtendereco.Text;
  DtmClientes.CdsClientesCEP.AsString := edtCEP.Text;
  DtmClientes.CdsClientesTELEFONE.AsString := edttelefone.Text;
  DtmClientes.CdsClientesEMAIL.AsString := edtemail.Text;
  DtmClientes.CdsClientesCONTATO.AsString := edtcontato.Text;
  DtmClientes.CdsClientes.Post;
  
  if DtmClientes.CdsClientes.ApplyUpdates(0)= 0 then
    begin
    ShowMessage('Dados Adicionados com sucesso!');
    EdtCod.Text := '';
    Edtnome.text := '';
    edtUF.Text := '';
    edtCidade.Text := '';
    edtCEP.Text := '';
    edtEndereco.Text := '';
    edtEmail.Text := '';
    edtTelefone.Text := '';
    EdtContato.Text := '';

    DtmClientes.CdsCod.Close;
    DtmClientes.CdsCod.CommandText := 'SELECT MAX(CODIGO)+1 AS COD FROM CLIENTES';
    DtmClientes.CdsCod.Open;
    edtCod.Text := IntToStr(DtmClientes.CdsCod.FieldByName('COD').AsInteger);
    Exit;
    end
        else
          begin
            ShowMessage('Erro ao Adicionar dados!');
            Exit;
          end;
end;

procedure TFrmClientes.BtnPesquisaClick(Sender: TObject);
begin
  DtmClientes.CdsClientes.Filter := 'upper(NOME) Like'+#39+uppercase(edtpesquisa.text)+'%'+#39;
  DtmClientes.CdsClientes.Filtered := true;
end;

end.
