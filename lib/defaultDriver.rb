require 'default.rb'
require 'defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class DailyInfoSoap < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://www.cbr.ru/DailyInfoWebServ/DailyInfo.asmx"

  Methods = [
    [ "http://web.cbr.ru/SaldoXML",
      "saldoXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "SaldoXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "SaldoXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/mrrf7D",
      "mrrf7D",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "mrrf7D"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "mrrf7DResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/mrrf7DXML",
      "mrrf7DXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "mrrf7DXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "mrrf7DXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/mrrf",
      "mrrf",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "mrrf"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "mrrfResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/mrrfXML",
      "mrrfXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "mrrfXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "mrrfXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/Saldo",
      "saldo",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "Saldo"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "SaldoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/NewsInfoXML",
      "newsInfoXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "NewsInfoXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "NewsInfoXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/OmodInfoXML",
      "omodInfoXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "OmodInfoXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "OmodInfoXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/XVol",
      "xVol",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "XVol"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "XVolResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/XVolXML",
      "xVolXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "XVolXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "XVolXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/MainInfoXML",
      "mainInfoXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "MainInfoXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "MainInfoXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/AllDataInfoXML",
      "allDataInfoXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "AllDataInfoXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "AllDataInfoXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/NewsInfo",
      "newsInfo",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "NewsInfo"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "NewsInfoResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/SwapDynamicXML",
      "swapDynamicXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "SwapDynamicXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "SwapDynamicXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/SwapDynamic",
      "swapDynamic",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "SwapDynamic"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "SwapDynamicResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/DepoDynamicXML",
      "depoDynamicXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "DepoDynamicXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "DepoDynamicXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/DepoDynamic",
      "depoDynamic",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "DepoDynamic"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "DepoDynamicResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/OstatDynamicXML",
      "ostatDynamicXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "OstatDynamicXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "OstatDynamicXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/OstatDynamic",
      "ostatDynamic",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "OstatDynamic"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "OstatDynamicResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/DragMetDynamicXML",
      "dragMetDynamicXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "DragMetDynamicXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "DragMetDynamicXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/DragMetDynamic",
      "dragMetDynamic",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "DragMetDynamic"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "DragMetDynamicResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetLatestDateTime",
      "getLatestDateTime",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetLatestDateTime"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetLatestDateTimeResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetLatestDate",
      "getLatestDate",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetLatestDate"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetLatestDateResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetLatestDateTimeSeld",
      "getLatestDateTimeSeld",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetLatestDateTimeSeld"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetLatestDateTimeSeldResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetLatestDateSeld",
      "getLatestDateSeld",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetLatestDateSeld"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetLatestDateSeldResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/EnumValutesXML",
      "enumValutesXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "EnumValutesXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "EnumValutesXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/EnumValutes",
      "enumValutes",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "EnumValutes"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "EnumValutesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetCursDynamicXML",
      "getCursDynamicXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetCursDynamicXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetCursDynamicXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetCursDynamic",
      "getCursDynamic",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetCursDynamic"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetCursDynamicResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetCursOnDateXML",
      "getCursOnDateXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetCursOnDateXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetCursOnDateXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetSeldCursOnDateXML",
      "getSeldCursOnDateXML",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetSeldCursOnDateXML"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetSeldCursOnDateXMLResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetSeldCursOnDate",
      "getSeldCursOnDate",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetSeldCursOnDate"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetSeldCursOnDateResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://web.cbr.ru/GetCursOnDate",
      "getCursOnDate",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetCursOnDate"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://web.cbr.ru/", "GetCursOnDateResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end

