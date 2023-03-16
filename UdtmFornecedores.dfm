object DtmFornecedores: TDtmFornecedores
  OldCreateOrder = False
  Left = 320
  Top = 246
  Height = 281
  Width = 305
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from fornecedores'
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RAZAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 38
      end
      item
        Name = 'CIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <
      item
        Name = 'IDX_U_CODIGO'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'CODIGO'
    Params = <>
    ProviderName = 'DspProvider'
    StoreDefs = True
    Left = 32
    Top = 160
    object ClientDataSet1CODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ClientDataSet1RAZAO: TStringField
      FieldName = 'RAZAO'
      FixedChar = True
      Size = 38
    end
    object ClientDataSet1CIDADE: TStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 30
    end
    object ClientDataSet1UF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object ClientDataSet1TELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object ClientDataSet1CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object ClientDataSet1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      FixedChar = True
      Size = 45
    end
  end
  object DspProvider: TDataSetProvider
    DataSet = QryFornecedor
    Options = [poAllowCommandText]
    Left = 32
    Top = 80
  end
  object QryFornecedor: TSQLQuery
    DataSource = DataSource1
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DtmGeral.SQLConnection1
    Left = 32
    Top = 16
  end
  object DspForCod: TDataSetProvider
    DataSet = QryFornecedor
    Options = [poAllowCommandText]
    Left = 184
    Top = 80
  end
  object CdsForCod: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from fornecedores'
    Params = <>
    ProviderName = 'DspForCod'
    Left = 184
    Top = 152
  end
  object DSCodigo: TDataSource
    DataSet = CdsForCod
    Left = 240
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 104
    Top = 80
  end
end
