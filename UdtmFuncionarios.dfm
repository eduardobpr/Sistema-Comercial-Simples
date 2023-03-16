object DtmFuncionarios: TDtmFuncionarios
  OldCreateOrder = False
  Left = 192
  Top = 122
  Height = 252
  Width = 385
  object CdsFuncionarios: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select * from Funcionarios'
    Params = <>
    ProviderName = 'DspFuncionarios'
    Left = 40
    Top = 144
    object CdsFuncionariosPRONTUARIO: TIntegerField
      FieldName = 'PRONTUARIO'
      Required = True
    end
    object CdsFuncionariosNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 38
    end
    object CdsFuncionariosENDERECO: TStringField
      FieldName = 'ENDERECO'
      FixedChar = True
      Size = 40
    end
    object CdsFuncionariosCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 30
    end
    object CdsFuncionariosCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CdsFuncionariosSALARIO: TFloatField
      FieldName = 'SALARIO'
    end
    object CdsFuncionariosDATAADM: TStringField
      FieldName = 'DATAADM'
      Size = 11
    end
    object CdsFuncionariosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object CdsFuncionariosUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object DspFuncionarios: TDataSetProvider
    DataSet = QryFuncionarios
    Options = [poAllowCommandText]
    Left = 40
    Top = 80
  end
  object QryFuncionarios: TSQLQuery
    Active = True
    DataSource = DSFuncionarios
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtmGeral.SQLConnection1
    Left = 40
    Top = 24
  end
  object DSFuncionarios: TDataSource
    DataSet = CdsFuncionarios
    Left = 120
    Top = 80
  end
  object CdsFunCod: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select * from funcionarios'
    Params = <>
    ProviderName = 'DspFunCod'
    Left = 224
    Top = 152
  end
  object DSfunCod: TDataSource
    DataSet = CdsFunCod
    Left = 312
    Top = 88
  end
  object DspFunCod: TDataSetProvider
    DataSet = QryFunCod
    Options = [poAllowCommandText]
    Left = 224
    Top = 88
  end
  object QryFunCod: TSQLQuery
    Active = True
    DataSource = DSfunCod
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtmGeral.SQLConnection1
    Left = 224
    Top = 24
  end
end
