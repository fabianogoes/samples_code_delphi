// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.9.200.156/DadosEnviocoleta/DadosEnvioColeta.asmx?WSDL
// Encoding : utf-8
// Version  : 1.0
// (18/05/2010 16:24:42 - 1.33.2.5)
// ************************************************************************ //

unit IColetaService.pas.old;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

var
  defWSDL: String;// = 'http://wserviceh.dellavolpe.com.br/IColeta/DadosEnvioColeta.asmx?WSDL';
  defURL : String;// = 'http://wserviceh.dellavolpe.com.br/IColeta/DadosEnvioColeta.asmx';

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"

  SoapLogin            = class;                 { "http://dellavolpe.com.br/Ws/IntegracaoColetaVale"[H] }



  // ************************************************************************ //
  // Namespace : http://dellavolpe.com.br/Ws/IntegracaoColetaVale
  // ************************************************************************ //
  SoapLogin = class(TSOAPHeader)
  private
    Fusuario: WideString;
    Fsenha: WideString;
    FTransactionid: WideString;
  published
    property usuario: WideString read Fusuario write Fusuario;
    property senha: WideString read Fsenha write Fsenha;
    property Transactionid: WideString read FTransactionid write FTransactionid;
  end;


  // ************************************************************************ //
  // Namespace : http://dellavolpe.com.br/Ws/IntegracaoColetaVale
  // soapAction: http://dellavolpe.com.br/Ws/IntegracaoColetaVale/SendColeta
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : DadosEnvioColetaSoap
  // service   : DadosEnvioColeta
  // port      : DadosEnvioColetaSoap
  // URL       : http://192.9.200.156/DadosEnviocoleta/DadosEnvioColeta.asmx
  // ************************************************************************ //
  DadosEnvioColetaSoap = interface(IInvokable)
  ['{C4CCC1A2-6840-1F01-551E-E6EAC4E6F18B}']
    function  SendColeta(const xml: WideString): WideString; stdcall;
  end;

function GetDadosEnvioColetaSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): DadosEnvioColetaSoap;


implementation

function GetDadosEnvioColetaSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): DadosEnvioColetaSoap;
const
  defSvc  = 'DadosEnvioColeta';
  defPrt  = 'DadosEnvioColetaSoap';
var
  RIO: THTTPRIO;
begin
  defWSDL := defURL + '?WSDL';

  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;

  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as DadosEnvioColetaSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(DadosEnvioColetaSoap), 'http://dellavolpe.com.br/Ws/IntegracaoColetaVale', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(DadosEnvioColetaSoap), 'http://dellavolpe.com.br/Ws/IntegracaoColetaVale/SendColeta');
  InvRegistry.RegisterHeaderClass(TypeInfo(DadosEnvioColetaSoap), SoapLogin, 'SoapLogin', '');
  RemClassRegistry.RegisterXSClass(SoapLogin, 'http://dellavolpe.com.br/Ws/IntegracaoColetaVale', 'SoapLogin');

end.