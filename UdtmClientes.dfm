object DtmClientes: TDtmClientes
  OldCreateOrder = False
  Left = 234
  Top = 218
  Height = 217
  Width = 350
  object QryClientes: TSQLQuery
    DataSource = DSclientes
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtmGeral.SQLConnection1
    Left = 16
    Top = 8
  end
  object DspClientes: TDataSetProvider
    DataSet = QryClientes
    Options = [poAllowCommandText]
    Left = 16
    Top = 64
  end
  object CdsClientes: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'Select * from clientes'
    Params = <>
    ProviderName = 'DspClientes'
    Left = 16
    Top = 128
    object CdsClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object CdsClientesNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 30
    end
    object CdsClientesUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object CdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 40
    end
    object CdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 30
    end
    object CdsClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      FixedChar = True
    end
    object CdsClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object CdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      FixedChar = True
      Size = 35
    end
    object CdsClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
  end
  object DSclientes: TDataSource
    DataSet = CdsClientes
    Left = 88
    Top = 64
  end
  object DSPCod: TDataSetProvider
    DataSet = QryCod
    Options = [poAllowCommandText]
    Left = 168
    Top = 64
  end
  object CDScod: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from clientes'
    Params = <>
    ProviderName = 'DSPCod'
    Left = 168
    Top = 128
  end
  object DSCOD: TDataSource
    DataSet = CDScod
    Left = 240
    Top = 64
  end
  object QryCod: TSQLQuery
    DataSource = DSCOD
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtmGeral.SQLConnection1
    Left = 168
    Top = 8
  end
end
