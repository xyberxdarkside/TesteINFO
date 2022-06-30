object fCadClientes: TfCadClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 390
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pMenu: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object sbPost: TSpeedButton
      Left = 282
      Top = 0
      Width = 101
      Height = 27
      Cursor = crHandPoint
      Hint = 'Confirmar as Altera'#231#245'es Atuais'
      Align = alLeft
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbPostClick
      ExplicitLeft = 284
    end
    object SbInsert: TSpeedButton
      Left = 124
      Top = 0
      Width = 79
      Height = 27
      Cursor = crHandPoint
      Hint = 'Inserir um Novo Registro'
      Align = alLeft
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SbInsertClick
    end
    object sbEdit: TSpeedButton
      Left = 203
      Top = 0
      Width = 79
      Height = 27
      Cursor = crHandPoint
      Hint = 'Editar o Registro Atual'
      Align = alLeft
      Caption = 'Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbEditClick
      ExplicitLeft = 204
    end
    object sbCancel: TSpeedButton
      Left = 383
      Top = 0
      Width = 101
      Height = 27
      Cursor = crHandPoint
      Hint = 'Cancelar a Opera'#231#227'o Atual'
      Align = alLeft
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbCancelClick
      ExplicitLeft = 386
    end
    object sbDelete: TSpeedButton
      Left = 484
      Top = 0
      Width = 90
      Height = 27
      Cursor = crHandPoint
      Hint = 'Excluir o Registro Atual'
      Align = alLeft
      Caption = 'Apagar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
        0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
        703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
        700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
        0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
        03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
        033333777777777773333333307770333333333337FFF7F33333333330000033
        3333333337777733333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbDeleteClick
      ExplicitLeft = 488
    end
    object DBNPrincipal: TDBNavigator
      Left = 0
      Top = 0
      Width = 124
      Height = 27
      DataSource = dsCadastro
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alLeft
      TabOrder = 0
    end
  end
  object PCPrincipal: TPageControl
    Left = 0
    Top = 27
    Width = 628
    Height = 344
    ActivePage = tsCadastro
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = PCPrincipalChange
    OnChanging = PCPrincipalChanging
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      object gbDadosCad: TGroupBox
        Left = 0
        Top = 0
        Width = 620
        Height = 145
        Align = alTop
        Caption = 'Dados Cadastrais'
        TabOrder = 0
        object Label1: TLabel
          Left = 38
          Top = 24
          Width = 37
          Height = 13
          Caption = 'C'#243'digo:'
        end
        object Label2: TLabel
          Left = 44
          Top = 46
          Width = 31
          Height = 13
          Caption = 'Nome:'
          FocusControl = DBENome
        end
        object DBTCodigo: TDBText
          Left = 78
          Top = 24
          Width = 52
          Height = 13
          AutoSize = True
          DataField = 'Codigo'
          DataSource = dsCadastro
        end
        object Label3: TLabel
          Left = 397
          Top = 24
          Width = 89
          Height = 13
          Caption = 'Data de Cadastro:'
        end
        object DBTDataCadastro: TDBText
          Left = 491
          Top = 24
          Width = 86
          Height = 13
          AutoSize = True
          DataField = 'DataCadastro'
          DataSource = dsCadastro
        end
        object Label4: TLabel
          Left = 52
          Top = 73
          Width = 23
          Height = 13
          Caption = 'CPF:'
          FocusControl = DBECPF
        end
        object Label5: TLabel
          Left = 227
          Top = 73
          Width = 46
          Height = 13
          Caption = 'Telefone:'
          FocusControl = DBETelefone
        end
        object Label6: TLabel
          Left = 43
          Top = 100
          Width = 32
          Height = 13
          Caption = 'E-Mail:'
          FocusControl = DBEEmail
        end
        object DBENome: TDBEdit
          Left = 76
          Top = 43
          Width = 498
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Nome'
          DataSource = dsCadastro
          TabOrder = 0
        end
        object DBECPF: TDBEdit
          Left = 76
          Top = 70
          Width = 147
          Height = 21
          DataField = 'CPF'
          DataSource = dsCadastro
          TabOrder = 1
          OnExit = DBECPFExit
        end
        object DBETelefone: TDBEdit
          Left = 275
          Top = 70
          Width = 104
          Height = 21
          DataField = 'Telefone'
          DataSource = dsCadastro
          TabOrder = 2
        end
        object DBEEmail: TDBEdit
          Left = 76
          Top = 97
          Width = 498
          Height = 21
          CharCase = ecLowerCase
          DataField = 'Email'
          DataSource = dsCadastro
          TabOrder = 3
          OnExit = DBEEmailExit
        end
      end
      object gbEndereco: TGroupBox
        Left = 0
        Top = 151
        Width = 620
        Height = 162
        Align = alBottom
        Caption = 'Endere'#231'o'
        TabOrder = 1
        object Label7: TLabel
          Left = 52
          Top = 21
          Width = 23
          Height = 13
          Caption = 'Cep:'
          FocusControl = DBECep
        end
        object Label8: TLabel
          Left = 16
          Top = 48
          Width = 59
          Height = 13
          Caption = 'Logradouro:'
          FocusControl = DBELogradouro
        end
        object Label9: TLabel
          Left = 454
          Top = 48
          Width = 41
          Height = 13
          Caption = 'N'#250'mero:'
          FocusControl = DBENumero
        end
        object Label10: TLabel
          Left = 6
          Top = 75
          Width = 69
          Height = 13
          Caption = 'Complemento:'
          FocusControl = DBEComplemento
        end
        object Label11: TLabel
          Left = 43
          Top = 104
          Width = 32
          Height = 13
          Caption = 'Bairro:'
          FocusControl = DBEBairro
        end
        object Label12: TLabel
          Left = 277
          Top = 103
          Width = 37
          Height = 13
          Caption = 'Cidade:'
          FocusControl = DBECidade
        end
        object Label13: TLabel
          Left = 492
          Top = 103
          Width = 17
          Height = 13
          Caption = 'UF:'
        end
        object Label14: TLabel
          Left = 52
          Top = 131
          Width = 23
          Height = 13
          Caption = 'Pa'#237's:'
          FocusControl = DBEPais
        end
        object sbFindCep: TSpeedButton
          Left = 177
          Top = 17
          Width = 23
          Height = 22
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          OnClick = sbFindCepClick
        end
        object DBECep: TDBEdit
          Left = 76
          Top = 18
          Width = 95
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Cep'
          DataSource = dsCadastro
          TabOrder = 0
          OnExit = DBECepExit
        end
        object DBELogradouro: TDBEdit
          Left = 76
          Top = 45
          Width = 374
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Logradouro'
          DataSource = dsCadastro
          TabOrder = 1
        end
        object DBENumero: TDBEdit
          Left = 497
          Top = 45
          Width = 77
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Numero'
          DataSource = dsCadastro
          TabOrder = 2
        end
        object DBEComplemento: TDBEdit
          Left = 76
          Top = 72
          Width = 440
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Complemento'
          DataSource = dsCadastro
          TabOrder = 3
        end
        object DBEBairro: TDBEdit
          Left = 76
          Top = 100
          Width = 197
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Bairro'
          DataSource = dsCadastro
          TabOrder = 4
        end
        object DBECidade: TDBEdit
          Left = 314
          Top = 100
          Width = 172
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Cidade'
          DataSource = dsCadastro
          TabOrder = 5
        end
        object DBCBUf: TDBComboBox
          Left = 515
          Top = 99
          Width = 59
          Height = 21
          Style = csDropDownList
          DataField = 'Estado'
          DataSource = dsCadastro
          Items.Strings = (
            'RO'
            'AC'
            'AM'
            'RR'
            'PA'
            'AP'
            'TO'
            'MA'
            'PI'
            'CE'
            'RN'
            'PB'
            'PE'
            'AL'
            'SE'
            'BA'
            'MG'
            'ES'
            'RJ'
            'SP'
            'PR'
            'SC'
            'RS'
            'MS'
            'MT'
            'GO'
            'DF')
          TabOrder = 6
        end
        object DBEPais: TDBEdit
          Left = 76
          Top = 128
          Width = 197
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Pais'
          DataSource = dsCadastro
          TabOrder = 7
        end
      end
    end
    object tsModo: TTabSheet
      Caption = 'Modo Tabela'
      ImageIndex = 1
      object DBGPrincipal: TDBGrid
        Left = 0
        Top = 0
        Width = 620
        Height = 313
        Align = alClient
        DataSource = dsCadastro
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Width = 120
            Visible = True
          end>
      end
    end
  end
  object sbPrincipal: TStatusBar
    Left = 0
    Top = 371
    Width = 628
    Height = 19
    BiDiMode = bdRightToLeft
    Panels = <
      item
        Width = 300
      end
      item
        Width = 300
      end>
    ParentBiDiMode = False
  end
  object mmPrincipal: TMainMenu
    Left = 368
    Top = 128
    object Aes1: TMenuItem
      Caption = 'A'#231#245'es'
      object Inserir1: TMenuItem
        Caption = 'Inserir'
        ShortCut = 45
      end
      object Editar1: TMenuItem
        Caption = 'Editar'
        ShortCut = 16453
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Confirmar1: TMenuItem
        Caption = 'Confirmar'
        ShortCut = 16464
      end
      object Cancelar1: TMenuItem
        Caption = 'Cancelar'
        ShortCut = 16474
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Excluir1: TMenuItem
        Caption = 'Apagar'
        ShortCut = 16430
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        ShortCut = 32883
      end
    end
  end
  object fdCadastro: TFDMemTable
    AfterOpen = fdCadastroAfterOpen
    AfterClose = fdCadastroAfterOpen
    AfterInsert = fdCadastroAfterInsert
    AfterEdit = fdCadastroAfterOpen
    AfterPost = fdCadastroAfterOpen
    AfterCancel = fdCadastroAfterOpen
    AfterDelete = fdCadastroAfterOpen
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 204
    Top = 70
    object fdCadastroCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
    object fdCadastroDataCadastro: TDateTimeField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DataCadastro'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdCadastroNome: TStringField
      FieldName = 'Nome'
      Size = 200
    end
    object fdCadastroCPF: TStringField
      FieldName = 'CPF'
      EditMask = '!999.999.999-99;0;'
      Size = 11
    end
    object fdCadastroTelefone: TStringField
      FieldName = 'Telefone'
      EditMask = '!\(99\)00000-0009;1;_'
    end
    object fdCadastroEmail: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'Email'
      Size = 255
    end
    object fdCadastroCep: TStringField
      FieldName = 'Cep'
      EditMask = '00000\-999;1;_'
    end
    object fdCadastroLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 200
    end
    object fdCadastroNumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Numero'
      Size = 10
    end
    object fdCadastroComplemento: TStringField
      FieldName = 'Complemento'
      Size = 100
    end
    object fdCadastroBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object fdCadastroCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object fdCadastroEstado: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 3
      FieldName = 'Estado'
      Size = 3
    end
    object fdCadastroPais: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'Pais'
      Size = 50
    end
    object fdCadastroXML: TBlobField
      FieldName = 'XML'
    end
  end
  object dsCadastro: TDataSource
    AutoEdit = False
    DataSet = fdCadastro
    Left = 244
    Top = 166
  end
end
