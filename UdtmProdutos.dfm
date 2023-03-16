object DtmProdutos: TDtmProdutos
  OldCreateOrder = False
  Left = 328
  Top = 216
  Height = 256
  Width = 404
  object CdsProdutos: TClientDataSet
    Active = True
    Aggregates = <>
    AutoCalcFields = False
    CommandText = 'select * from produtos'
    Params = <>
    ProviderName = 'DspProdutos'
    Left = 48
    Top = 136
    object CdsProdutosIDPROD: TIntegerField
      FieldName = 'IDPROD'
      Required = True
    end
    object CdsProdutosCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
    end
    object CdsProdutosNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 30
    end
    object CdsProdutosQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object CdsProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 11
    end
    object CdsProdutosFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      FixedChar = True
      Size = 35
    end
    object CdsProdutosPRECOVENDA: TFloatField
      FieldName = 'PRECO VENDA'
    end
  end
  object DspProdutos: TDataSetProvider
    DataSet = QryProdutos
    Options = [poAllowCommandText]
    Left = 48
    Top = 80
  end
  object DsProdutos: TDataSource
    DataSet = CdsProdutos
    Left = 128
    Top = 72
  end
  object QryProdutos: TSQLQuery
    Active = True
    DataSource = DsProdutos
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtmGeral.SQLConnection1
    Left = 48
    Top = 24
  end
  object CdsProdCod: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from produtos'
    Params = <>
    ProviderName = 'DspProdCod'
    Left = 240
    Top = 136
  end
  object DspProdCod: TDataSetProvider
    DataSet = QryProdutos
    Options = [poAllowCommandText]
    Left = 240
    Top = 80
  end
  object DSprodCod: TDataSource
    DataSet = CdsProdCod
    Left = 320
    Top = 80
  end
end
