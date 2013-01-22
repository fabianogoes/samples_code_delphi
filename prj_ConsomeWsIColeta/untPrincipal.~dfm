object Form1: TForm1
  Left = 202
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Consumindo o Web Service de Integra'#231#227'o de Coleta'
  ClientHeight = 573
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Courier New'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    760
    573)
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 20
    Top = 10
    Width = 719
    Height = 477
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Resposta web service:'
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 355
      Top = 18
      Height = 195
    end
    object Splitter2: TSplitter
      Left = 2
      Top = 213
      Width = 715
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object pnlServicos: TPanel
      Left = 2
      Top = 355
      Width = 715
      Height = 120
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        715
        120)
      object Label1: TLabel
        Left = 5
        Top = 7
        Width = 130
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Xml de Envio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = 8816262
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 5
        Top = 35
        Width = 130
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Salvar Resposta:'
        Font.Charset = ANSI_CHARSET
        Font.Color = 8816262
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 5
        Top = 60
        Width = 130
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'TransactionID:'
        Font.Charset = ANSI_CHARSET
        Font.Color = 8816262
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnSalvar: TButton
        Left = 410
        Top = 84
        Width = 150
        Height = 30
        Anchors = [akBottom]
        Caption = 'Salvar Resposta'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnSalvarClick
      end
      object Button1: TButton
        Left = 260
        Top = 84
        Width = 150
        Height = 30
        Anchors = [akBottom]
        Caption = 'Enviar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
      object edtXmlEnvio: TJvFilenameEdit
        Left = 135
        Top = 5
        Width = 576
        Height = 24
        TabOrder = 2
        Text = 'C:\DadosEnvioColeta.xml'
      end
      object edtXmlRetorno: TJvDirectoryEdit
        Left = 135
        Top = 31
        Width = 576
        Height = 24
        DialogKind = dkWin32
        TabOrder = 3
        Text = 'c:\Resposta.xml'
      end
      object btnLimpar: TButton
        Left = 560
        Top = 84
        Width = 150
        Height = 30
        Anchors = [akBottom]
        Caption = 'Limpar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnLimparClick
      end
      object rbProducao: TRadioButton
        Left = 8
        Top = 100
        Width = 168
        Height = 17
        Caption = 'Enviar em Produ'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = 8750469
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object rbHomologacao: TRadioButton
        Left = 8
        Top = 84
        Width = 193
        Height = 17
        Caption = 'Enviar em Homologa'#231#227'o'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 8750469
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        TabStop = True
      end
      object edtTransactionID: TEdit
        Left = 135
        Top = 56
        Width = 575
        Height = 24
        TabOrder = 7
        Text = 'TESTE_INTERNO'
      end
    end
    object TreeView1: TTreeView
      Left = 358
      Top = 18
      Width = 359
      Height = 195
      Align = alClient
      Indent = 19
      TabOrder = 1
      OnCollapsed = TreeView1Collapsed
      OnExpanded = TreeView1Expanded
    end
    object ValueListEditor: TValueListEditor
      Left = 2
      Top = 18
      Width = 353
      Height = 195
      Align = alLeft
      TabOrder = 2
      ColWidths = (
        136
        211)
    end
    object lbxLog: TListBox
      Left = 2
      Top = 216
      Width = 715
      Height = 139
      Align = alBottom
      Color = 13434879
      ItemHeight = 16
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 20
    Top = 488
    Width = 719
    Height = 78
    Anchors = [akRight, akBottom]
    Caption = 'Configura'#231#245'es do Host:'
    TabOrder = 1
    object Label4: TLabel
      Left = 5
      Top = 49
      Width = 130
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'URL Produ'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8816262
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 5
      Top = 22
      Width = 130
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'URL Homologa'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8816262
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUrlProducao: TEdit
      Left = 135
      Top = 46
      Width = 579
      Height = 24
      Color = 13434879
      TabOrder = 0
      Text = 'http://wservice.dellavolpe.com.br/IColeta/DadosEnvioColeta.asmx'
    end
    object edtUrlHomologacao: TEdit
      Left = 135
      Top = 19
      Width = 579
      Height = 24
      Color = 13434879
      TabOrder = 1
      Text = 'http://wserviceh.dellavolpe.com.br/IColeta/DadosEnvioColeta.asmx'
    end
  end
  object XMLDocEnvio: TXMLDocument
    Left = 540
    Top = 30
    DOMVendorDesc = 'MSXML'
  end
  object SaveDialog1: TSaveDialog
    FileName = 'c:\RetornoColeta.xml'
    Filter = '*.xml|Arquivos xml '
    InitialDir = 'c:\'
    Left = 510
    Top = 30
  end
  object XMLDocResposta: TXMLDocument
    Left = 570
    Top = 30
    DOMVendorDesc = 'MSXML'
  end
end
