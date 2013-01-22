unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IColetaService,InvokeRegistry, StdCtrls, xmldom, XMLIntf,
  msxmldom, XMLDoc, ExtCtrls, ComCtrls, JvToolEdit, Mask, JvExMask,
  JvExStdCtrls, JvEdit, JvValidateEdit, SOAPHTTPClient, IniFiles, Grids,
  ValEdit, soaphttptrans;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    XMLDocEnvio: TXMLDocument;
    pnlServicos: TPanel;
    btnSalvar: TButton;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    TreeView1: TTreeView;
    XMLDocResposta: TXMLDocument;
    edtXmlEnvio: TJvFilenameEdit;
    edtXmlRetorno: TJvDirectoryEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnLimpar: TButton;
    GroupBox2: TGroupBox;
    edtUrlProducao: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtUrlHomologacao: TEdit;
    rbProducao: TRadioButton;
    rbHomologacao: TRadioButton;
    Label3: TLabel;
    edtTransactionID: TEdit;
    ValueListEditor: TValueListEditor;
    Splitter1: TSplitter;
    lbxLog: TListBox;
    Splitter2: TSplitter;
    procedure Button1Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure TreeView1Expanded(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Collapsed(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateTree(XmlNode: IXMLNode; TreeNode: TTreeNode);
    procedure PopulaListaValue;
    function ReplaceInvalidChar(const pValue: string): string;
    function GetChamado: string;
    function GetReturnStatus: string;
  public
    { Public declarations }
    property Chamado: string read GetChamado;
    property ReturnStatus: string read GetReturnStatus;
  end;

var
  Form1: TForm1;

implementation

uses StrUtils;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var vXmlResposta: string;
    vHttpRio: THTTPRIO;
    vLogin: SoapLogin;
begin
      defURL := IfThen(rbHomologacao.Checked, edtUrlHomologacao.Text, edtUrlProducao.Text);
      vHttpRio := THTTPRIO.Create(Self);
      vLogin := SoapLogin.Create;
      TButton(Sender).Enabled := False;
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      try
        XMLDocEnvio.Active := False;
        XMLDocEnvio.LoadFromFile(edtXmlEnvio.Text);
        XMLDocEnvio.Active := True;

        vLogin.usuario := 'accesstage';
        vLogin.senha := 'accesstage';
        vLogin.Transactionid := edtTransactionID.Text;
        vHttpRio.SOAPHeaders.Send(vLogin);

        try

            vXmlResposta := GetDadosEnvioColetaSoap(False, '', vHttpRio).SendColeta(XMLDocEnvio.XML.Text);

            if vXmlResposta = EmptyStr then
            begin
                ShowMessage('Retorno vazio!!!');
                exit;
            end;

            XMLDocResposta.Active   := False;
            XMLDocResposta.XML.Text := ReplaceInvalidChar(vXmlResposta);
            XMLDocResposta.Active   := True;

            TreeView1.Items.Clear;
            GenerateTree(XMLDocResposta.DocumentElement, nil);
            btnSalvar.Enabled := True;
            PopulaListaValue();
            lbxLog.Items.SaveToFile(Application.ExeName+'.log');

        except on e: Exception do
            ShowMessage(e.Message);
        end;

      finally
        TButton(Sender).Enabled := True;
        vHttpRio.Free;
        vLogin.Free;
        Screen.Cursor := crDefault;
        Application.ProcessMessages;
      end;
end;

procedure TForm1.btnLimparClick(Sender: TObject);
begin
    TreeView1.Items.Clear;
    ValueListEditor.Values['Chamado']       := EmptyStr;
    ValueListEditor.Values['ReturnStatus']  := EmptyStr;
    ValueListEditor.Values['ExceptionCode'] := EmptyStr;
    ValueListEditor.Values['ExceptionType'] := EmptyStr;
    ValueListEditor.Values['ExceptionType'] := EmptyStr;
    btnSalvar.Enabled := False;
    lbxLog.Clear;    
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
      XMLDocResposta.XML.SaveToFile(edtXmlRetorno.Text);
      ShowMessage('Retorno salvo com sucesso!'+#13+
                  'Salvo em: '+edtXmlRetorno.Text+#13+
                  '-----------------------------------'+#13+
                  XMLDocResposta.XML.Text);
end;

procedure TForm1.GenerateTree(XmlNode: IXMLNode; TreeNode: TTreeNode);
var
  NodeText: string;
  NewTreeNode: TTreeNode;
  i: integer;
begin
      if XmlNode.NodeType <> ntElement then
        exit;

      NodeText := '<' + XmlNode.NodeName + '>';

      if XmlNode.IsTextElement then
          begin
          NodeText := NodeText + XmlNode.NodeValue + StringReplace(NodeText, '<', '</', []);
          end;

      NewTreeNode := TreeView1.Items.AddChild(TreeNode, NodeText);

      if XmlNode.HasChildNodes then
        begin
              for i := 0 to XmlNode.ChildNodes.Count - 1 do
                begin
                GenerateTree(XmlNode.ChildNodes[i], NewTreeNode);
                end;
        end;


end;

procedure TForm1.TreeView1Expanded(Sender: TObject; Node: TTreeNode);
var
  vEndNode: string;
begin
      vEndNode := StringReplace(Node.Text, '<', '</', []);

      if TreeView1.Items[TreeView1.Items.Count-1].Text <> vEndNode then
        begin
        TreeView1.Items.Add(node, vEndNode);
        end;
end;

procedure TForm1.TreeView1Collapsed(Sender: TObject; Node: TTreeNode);
begin
      TreeView1.Items.Clear;
      GenerateTree(XMLDocResposta.DocumentElement, nil);
end;

function TForm1.ReplaceInvalidChar(const pValue: string): string;
begin
    Result := Result + StringReplace(
                       StringReplace(
                       StringReplace(
                       StringReplace(
                       StringReplace(
                       StringReplace(
                       StringReplace(
                       StringReplace(
                       StringReplace(
                       StringReplace(
                       StringReplace(
                          pValue,'ã','a',[rfReplaceAll,rfIgnoreCase]),
                                 'á','a',[rfReplaceAll,rfIgnoreCase]),
                                 'à','a',[rfReplaceAll,rfIgnoreCase]),
                                 'é','e',[rfReplaceAll,rfIgnoreCase]),
                                 'è','e',[rfReplaceAll,rfIgnoreCase]),
                                 'í','i',[rfReplaceAll,rfIgnoreCase]),
                                 'ì','i',[rfReplaceAll,rfIgnoreCase]),
                                 'ó','o',[rfReplaceAll,rfIgnoreCase]),
                                 'ò','o',[rfReplaceAll,rfIgnoreCase]),
                                 'ù','u',[rfReplaceAll,rfIgnoreCase]),
                                 'ú','u',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TForm1.FormCreate(Sender: TObject);
var vConfig: TIniFile;
    vFile: string;
begin
    vFile   := Application.ExeName+'.config';
    vConfig := TIniFile.Create(vFile);
    try
        edtUrlHomologacao.Text  := vConfig.ReadString('URL','HOMOLOGACAO','');
        edtUrlProducao.Text     := vConfig.ReadString('URL', 'PRODUCAO','');
        edtXmlEnvio.Text        := vConfig.ReadString('FILE', 'SEND DEFAULT', '');
        btnLimparClick(Sender);
    finally
        vConfig.Free;
    end;
end;

procedure TForm1.PopulaListaValue;
var vExceptionCode, vExceptionType, vExceptionDescription : string;
begin
    vExceptionCode  := EmptyStr;
    vExceptionType  := EmptyStr;
    vExceptionDescription := EmptyStr;

    lbxLog.Items.Append('Chamado: '+Self.Chamado+' | ReturnStatus: '+Self.ReturnStatus);
    lbxLog.Items.Append('************************************************************');

    if Self.ReturnStatus = 'NOK'then
    begin
        //                             <DadosRespostaColeta> <Exception>         <ExceptionCode>
        vExceptionCode := XMLDocResposta.ChildNodes.Nodes[1].ChildNodes.Nodes[1].ChildNodes.Nodes[0].NodeValue;
        //                             <DadosRespostaColeta> <Exception>         <ExceptionType>
        vExceptionType := XMLDocResposta.ChildNodes.Nodes[1].ChildNodes.Nodes[1].ChildNodes.Nodes[1].NodeValue;
        //                                    <DadosRespostaColeta> <Exception>         <ExceptionDescription>
        vExceptionDescription := XMLDocResposta.ChildNodes.Nodes[1].ChildNodes.Nodes[1].ChildNodes.Nodes[2].NodeValue;
    end;

    lbxLog.Items.Append('ExceptionCode: '+vExceptionCode);
    lbxLog.Items.Append('ExceptionType: '+vExceptionType);
    lbxLog.Items.Append('ExceptionDescription: '+vExceptionDescription);

    lbxLog.Items.Add('************************************************************');

    ValueListEditor.Values['Chamado']       := Self.Chamado;
    ValueListEditor.Values['ReturnStatus']  := Self.ReturnStatus;
    ValueListEditor.Values['ExceptionCode'] := vExceptionCode;
    ValueListEditor.Values['ExceptionType'] := vExceptionType;
    ValueListEditor.Values['ExceptionType'] := vExceptionDescription;
end;

function TForm1.GetChamado: string;
begin
    if not XMLDocEnvio.Active then
      if FileExists(edtXmlEnvio.Text) then
      begin
        XMLDocEnvio.Active := False;
        XMLDocEnvio.LoadFromFile(edtXmlEnvio.Text);
        XMLDocEnvio.Active := True;
      end;
    //                   <dados_envio_coleta> <dados_chamado>     <numero>
    Result := XMLDocEnvio.ChildNodes.Nodes[1].ChildNodes.Nodes[0].ChildNodes.Nodes[0].NodeValue;
end;

function TForm1.GetReturnStatus: string;
begin
    if XMLDocEnvio.Active then
    begin
        //                     <DadosRespostaColeta>  <ReturnStatus>
        Result := XMLDocResposta.ChildNodes.Nodes[1].ChildNodes.Nodes[0].NodeValue;
    end;
end;

initialization
  InvRegistry.RegisterInvokeOptions(TypeInfo(DadosEnvioColetaSoap), ioDocument);

end.
