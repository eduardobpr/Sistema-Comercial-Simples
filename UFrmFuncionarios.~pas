unit UFrmFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask;

type
  TFrmFuncionarios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EdtPesquisa: TEdit;
    BtnPesquisar: TBitBtn;
    BtnAdicionar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnEditar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnSair: TBitBtn;
    Label1: TLabel;
    EdtProntuario: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtEndereco: TEdit;
    Label4: TLabel;
    EdtCEP: TEdit;
    Label5: TLabel;
    EdtCidade: TEdit;
    Label6: TLabel;
    Edtdataadm: TEdit;
    Label7: TLabel;
    EdtSalario: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtuf: TEdit;
    BtnAlteracoes: TBitBtn;
    EdtTelefone: TMaskEdit;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAlteracoesClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionarios: TFrmFuncionarios;

implementation

uses UdtmFuncionarios;
{$R *.dfm}

procedure TFrmFuncionarios.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFuncionarios.BtnCancelarClick(Sender: TObject);
begin
 DtmFuncionarios.CdsFuncionarios.Cancel;
end;

procedure TFrmFuncionarios.BtnExcluirClick(Sender: TObject);
begin
  DtmFuncionarios.CdsFuncionarios.Delete;
end;

procedure TFrmFuncionarios.BtnEditarClick(Sender: TObject);
begin
  DtmFuncionarios.CdsFuncionarios.Edit;
  edtprontuario.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('PRONTUARIO').AsString;
  edtnome.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('NOME').AsString;
  edtendereco.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('ENDERECO').AsString;
  edtcidade.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('CIDADE').AsString;
  edtcep.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('CEP').AsString;
  edtsalario.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('SALARIO').AsString;
  edtdataadm.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('DATAADM').AsString;
  edttelefone.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('TELEFONE').AsString;
  edtuf.Text:=DtmFuncionarios.CdsFuncionarios.FieldByName('UF').AsString;
end;

procedure TFrmFuncionarios.BtnGravarClick(Sender: TObject);
begin
  DtmFuncionarios.CdsFuncionarios.Post;
  DtmFuncionarios.CdsFuncionarios.ApplyUpdates(0);
end;

procedure TFrmFuncionarios.BtnAdicionarClick(Sender: TObject);
begin

if trim(edtnome.text) = '' then
    begin
    edtnome.setfocus;
    raise exception.create('Entre com o nome do funcionario');
    end;

	if trim(edtendereco.text) = '' then
    	begin
    	edtendereco.setfocus;
    	raise exception.create('Entre com o endereco do funcionario');
    	end;

  		if trim(edtcidade.text) = '' then
    		begin
    		edtcidade.setfocus;
    		raise exception.create('Entre com a cidade do funcionario');
		    end;

  			    if trim(edtuf.text) = '' then
    			    begin
    			      edtuf.setfocus;
    			      raise exception.create('Entre com o estado');
              end;

                  if trim(edtsalario.text) = '' then
    			          begin
                      edtsalario.setfocus;
    			            raise exception.create('Entre com o salario');
                    end;

                              if trim(edtdataadm.text) = '' then
    			                      begin
                                  edtdataadm.setfocus;
    			                        raise exception.create('Entre com a data de admissão');
                                end;


  DtmFuncionarios.CdsFuncionarios.Edit;
  dtmfuncionarios.CdsFuncionariosNOME.AsString := edtnome.Text;
  dtmfuncionarios.CdsFuncionariosENDERECO.AsString := edtendereco.Text;
  dtmfuncionarios.CdsFuncionariosCIDADE.AsString := edtcidade.Text;
  dtmfuncionarios.CdsFuncionariosUF.AsString := edtuf.Text;
  dtmfuncionarios.CdsFuncionariosSALARIO.AsString := edtsalario.Text;
  dtmfuncionarios.CdsFuncionariosTELEFONE.AsString := edtTelefone.Text;
  dtmfuncionarios.CdsFuncionariosCEP.AsString := edtcep.Text;
  dtmfuncionarios.CdsFuncionariosDATAADM.AsString := edtdataadm.Text;
  dtmfuncionarios.CdsFuncionarios.Post;
  if dtmfuncionarios.CdsFuncionarios.ApplyUpdates(0) = 0 then
  begin
    ShowMessage('Dados gravados com sucesso!');
    Edtprontuario.text := '';
    edtnome.Text := '';
    edtCidade.Text := '';
    edtUF.Text := '';
    edtEndereco.Text := '';
    edtsalario.Text := '';
    edtTelefone.Text := '';
    edtdataadm.Text := '';
    edtcep.Text := '';

    DtmFuncionarios.Cdsfuncod.Close;
    DtmFuncionarios.Cdsfuncod.CommandText := 'SELECT MAX(PRONTUARIO)+1 AS COD FROM FUNCIONARIOS';
    DtmFuncionarios.Cdsfuncod.Open;
    edtprontuario.Text := IntToStr(DtmFuncionarios.Cdsfuncod.FieldByName('COD').AsInteger);
    Exit;
  end
  else
  begin
    ShowMessage('Erro ao gravar dados!');
    Exit;
  end;
end;


procedure TFrmFuncionarios.FormShow(Sender: TObject);
begin
    DtmFuncionarios.Cdsfuncod.Close;
    DtmFuncionarios.Cdsfuncod.CommandText := 'SELECT MAX(PRONTUARIO)+1 AS COD FROM FUNCIONARIOS';
    DtmFuncionarios.Cdsfuncod.Open;
    edtprontuario.Text := IntToStr(DtmFuncionarios.Cdsfuncod.FieldByName('COD').AsInteger);
    Exit;
end;

procedure TFrmFuncionarios.BtnAlteracoesClick(Sender: TObject);
begin
  DtmFuncionarios.CdsFuncionarios.Edit;
  DtmFuncionarios.CdsFuncionariosPRONTUARIO.AsString := edtprontuario.text;
  dtmfuncionarios.CdsFuncionariosNOME.AsString := edtnome.Text;
  dtmfuncionarios.CdsFuncionariosENDERECO.AsString := edtendereco.Text;
  dtmfuncionarios.CdsFuncionariosCIDADE.AsString := edtcidade.Text;
  dtmfuncionarios.CdsFuncionariosUF.AsString := edtuf.Text;
  dtmfuncionarios.CdsFuncionariosSALARIO.AsString := edtsalario.Text;
  dtmfuncionarios.CdsFuncionariosTELEFONE.AsString := edtTelefone.Text;
  dtmfuncionarios.CdsFuncionariosCEP.AsString := edtcep.Text;
  dtmfuncionarios.CdsFuncionariosDATAADM.AsString := edtdataadm.Text;
  dtmfuncionarios.CdsFuncionarios.Post;
  if dtmfuncionarios.CdsFuncionarios.ApplyUpdates(0) = 0 then
  begin
    ShowMessage('Dados gravados com sucesso!');
    Edtprontuario.text := '';
    edtnome.Text := '';
    edtCidade.Text := '';
    edtUF.Text := '';
    edtEndereco.Text := '';
    edtsalario.Text := '';
    edtTelefone.Text := '';
    edtdataadm.Text := '';
    edtcep.Text := '';

    DtmFuncionarios.Cdsfuncod.Close;
    DtmFuncionarios.Cdsfuncod.CommandText := 'SELECT MAX(PRONTUARIO)+1 AS COD FROM FUNCIONARIOS';
    DtmFuncionarios.Cdsfuncod.Open;
    edtprontuario.Text := IntToStr(DtmFuncionarios.Cdsfuncod.FieldByName('COD').AsInteger);
    Exit;
  end
  else
  begin
    ShowMessage('Erro ao gravar dados!');
    Exit;
  end;
end;


procedure TFrmFuncionarios.BtnPesquisarClick(Sender: TObject);
begin
  DtmFuncionarios.CdsFuncionarios.Filter := 'upper(NOME) Like'+#39+uppercase(edtpesquisa.text)+'%'+#39;
  DtmFuncionarios.CdsFuncionarios.Filtered := true;
end;

end.
