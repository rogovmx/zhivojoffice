require 'Orders.rb'
require 'OrdersMappingRegistry.rb'
require 'soap/rpc/driver'

class OrdersPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://192.168.0.15/trade10/ws/orders"

  Methods = [
    [ "http://192.168.0.15#Orders:NewOrder",
      "newOrder",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewOrder"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewOrderResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:NewCorrect",
      "newCorrect",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewCorrect"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewCorrectResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:GetContactors",
      "getContactors",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "GetContactors"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "GetContactorsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:GetOrder",
      "getOrder",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "GetOrder"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "GetOrderResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:NewContactors",
      "newContactors",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewContactors"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewContactorsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:NewContacts",
      "newContacts",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewContacts"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewContactsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:NewAccount",
      "newAccount",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewAccount"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewAccountResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:NewDogovor",
      "newDogovor",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewDogovor"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewDogovorResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:NewPoint",
      "newPoint",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewPoint"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "NewPointResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:GetOstatok",
      "getOstatok",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "GetOstatok"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "GetOstatokResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ],
    [ "http://192.168.0.15#Orders:GetDocuments",
      "getDocuments",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "GetDocuments"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://192.168.0.15", "GetDocumentsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = OrdersMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = OrdersMappingRegistry::LiteralRegistry
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

