require 'default.rb'
require 'soap/mapping'

module DefaultMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsWebCbrRu = "http://web.cbr.ru/"
  NsXMLSchema = "http://www.w3.org/2001/XMLSchema"

  LiteralRegistry.register(
    :class => SaldoXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SaldoXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => SaldoXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SaldoXMLResponse"),
    :schema_element => [
      ["saldoXMLResult", ["SaldoXMLResponse::SaldoXMLResult", XSD::QName.new(NsWebCbrRu, "SaldoXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => SaldoXMLResponse::SaldoXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SaldoXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => Mrrf7D,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrf7D"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => Mrrf7DResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrf7DResponse"),
    :schema_element => [
      ["mrrf7DResult", "Mrrf7DResponse::Mrrf7DResult", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => Mrrf7DResponse::Mrrf7DResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrf7DResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => Mrrf7DXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrf7DXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => Mrrf7DXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrf7DXMLResponse"),
    :schema_element => [
      ["mrrf7DXMLResult", "Mrrf7DXMLResponse::Mrrf7DXMLResult", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => Mrrf7DXMLResponse::Mrrf7DXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrf7DXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => Mrrf,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrf"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => MrrfResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrfResponse"),
    :schema_element => [
      ["mrrfResult", "MrrfResponse::MrrfResult", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => MrrfResponse::MrrfResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrfResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => MrrfXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrfXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => MrrfXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrfXMLResponse"),
    :schema_element => [
      ["mrrfXMLResult", "MrrfXMLResponse::MrrfXMLResult", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => MrrfXMLResponse::MrrfXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "mrrfXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => Saldo,
    :schema_name => XSD::QName.new(NsWebCbrRu, "Saldo"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => SaldoResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SaldoResponse"),
    :schema_element => [
      ["saldoResult", ["SaldoResponse::SaldoResult", XSD::QName.new(NsWebCbrRu, "SaldoResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => SaldoResponse::SaldoResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SaldoResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewsInfoXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "NewsInfoXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewsInfoXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "NewsInfoXMLResponse"),
    :schema_element => [
      ["newsInfoXMLResult", ["NewsInfoXMLResponse::NewsInfoXMLResult", XSD::QName.new(NsWebCbrRu, "NewsInfoXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => NewsInfoXMLResponse::NewsInfoXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "NewsInfoXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => OmodInfoXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OmodInfoXML"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => OmodInfoXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OmodInfoXMLResponse"),
    :schema_element => [
      ["omodInfoXMLResult", ["OmodInfoXMLResponse::OmodInfoXMLResult", XSD::QName.new(NsWebCbrRu, "OmodInfoXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => OmodInfoXMLResponse::OmodInfoXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OmodInfoXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => XVol,
    :schema_name => XSD::QName.new(NsWebCbrRu, "XVol"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => XVolResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "XVolResponse"),
    :schema_element => [
      ["xVolResult", ["XVolResponse::XVolResult", XSD::QName.new(NsWebCbrRu, "XVolResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => XVolResponse::XVolResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "XVolResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => XVolXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "XVolXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => XVolXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "XVolXMLResponse"),
    :schema_element => [
      ["xVolXMLResult", ["XVolXMLResponse::XVolXMLResult", XSD::QName.new(NsWebCbrRu, "XVolXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => XVolXMLResponse::XVolXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "XVolXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => MainInfoXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "MainInfoXML"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => MainInfoXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "MainInfoXMLResponse"),
    :schema_element => [
      ["mainInfoXMLResult", ["MainInfoXMLResponse::MainInfoXMLResult", XSD::QName.new(NsWebCbrRu, "MainInfoXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => MainInfoXMLResponse::MainInfoXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "MainInfoXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => AllDataInfoXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "AllDataInfoXML"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => AllDataInfoXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "AllDataInfoXMLResponse"),
    :schema_element => [
      ["allDataInfoXMLResult", ["AllDataInfoXMLResponse::AllDataInfoXMLResult", XSD::QName.new(NsWebCbrRu, "AllDataInfoXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => AllDataInfoXMLResponse::AllDataInfoXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "AllDataInfoXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewsInfo,
    :schema_name => XSD::QName.new(NsWebCbrRu, "NewsInfo"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewsInfoResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "NewsInfoResponse"),
    :schema_element => [
      ["newsInfoResult", ["NewsInfoResponse::NewsInfoResult", XSD::QName.new(NsWebCbrRu, "NewsInfoResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => NewsInfoResponse::NewsInfoResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "NewsInfoResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => SwapDynamicXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SwapDynamicXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => SwapDynamicXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SwapDynamicXMLResponse"),
    :schema_element => [
      ["swapDynamicXMLResult", ["SwapDynamicXMLResponse::SwapDynamicXMLResult", XSD::QName.new(NsWebCbrRu, "SwapDynamicXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => SwapDynamicXMLResponse::SwapDynamicXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SwapDynamicXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => SwapDynamic,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SwapDynamic"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => SwapDynamicResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SwapDynamicResponse"),
    :schema_element => [
      ["swapDynamicResult", ["SwapDynamicResponse::SwapDynamicResult", XSD::QName.new(NsWebCbrRu, "SwapDynamicResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => SwapDynamicResponse::SwapDynamicResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "SwapDynamicResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => DepoDynamicXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DepoDynamicXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => DepoDynamicXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DepoDynamicXMLResponse"),
    :schema_element => [
      ["depoDynamicXMLResult", ["DepoDynamicXMLResponse::DepoDynamicXMLResult", XSD::QName.new(NsWebCbrRu, "DepoDynamicXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => DepoDynamicXMLResponse::DepoDynamicXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DepoDynamicXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => DepoDynamic,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DepoDynamic"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => DepoDynamicResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DepoDynamicResponse"),
    :schema_element => [
      ["depoDynamicResult", ["DepoDynamicResponse::DepoDynamicResult", XSD::QName.new(NsWebCbrRu, "DepoDynamicResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => DepoDynamicResponse::DepoDynamicResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DepoDynamicResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => OstatDynamicXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OstatDynamicXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => OstatDynamicXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OstatDynamicXMLResponse"),
    :schema_element => [
      ["ostatDynamicXMLResult", ["OstatDynamicXMLResponse::OstatDynamicXMLResult", XSD::QName.new(NsWebCbrRu, "OstatDynamicXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => OstatDynamicXMLResponse::OstatDynamicXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OstatDynamicXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => OstatDynamic,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OstatDynamic"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => OstatDynamicResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OstatDynamicResponse"),
    :schema_element => [
      ["ostatDynamicResult", ["OstatDynamicResponse::OstatDynamicResult", XSD::QName.new(NsWebCbrRu, "OstatDynamicResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => OstatDynamicResponse::OstatDynamicResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "OstatDynamicResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => DragMetDynamicXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DragMetDynamicXML"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => DragMetDynamicXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DragMetDynamicXMLResponse"),
    :schema_element => [
      ["dragMetDynamicXMLResult", ["DragMetDynamicXMLResponse::DragMetDynamicXMLResult", XSD::QName.new(NsWebCbrRu, "DragMetDynamicXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => DragMetDynamicXMLResponse::DragMetDynamicXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DragMetDynamicXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => DragMetDynamic,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DragMetDynamic"),
    :schema_element => [
      ["fromDate", "SOAP::SOAPDateTime"],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => DragMetDynamicResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DragMetDynamicResponse"),
    :schema_element => [
      ["dragMetDynamicResult", ["DragMetDynamicResponse::DragMetDynamicResult", XSD::QName.new(NsWebCbrRu, "DragMetDynamicResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => DragMetDynamicResponse::DragMetDynamicResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "DragMetDynamicResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetLatestDateTime,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetLatestDateTime"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => GetLatestDateTimeResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetLatestDateTimeResponse"),
    :schema_element => [
      ["getLatestDateTimeResult", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "GetLatestDateTimeResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetLatestDate,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetLatestDate"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => GetLatestDateResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetLatestDateResponse"),
    :schema_element => [
      ["getLatestDateResult", ["SOAP::SOAPString", XSD::QName.new(NsWebCbrRu, "GetLatestDateResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetLatestDateTimeSeld,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetLatestDateTimeSeld"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => GetLatestDateTimeSeldResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetLatestDateTimeSeldResponse"),
    :schema_element => [
      ["getLatestDateTimeSeldResult", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "GetLatestDateTimeSeldResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetLatestDateSeld,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetLatestDateSeld"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => GetLatestDateSeldResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetLatestDateSeldResponse"),
    :schema_element => [
      ["getLatestDateSeldResult", ["SOAP::SOAPString", XSD::QName.new(NsWebCbrRu, "GetLatestDateSeldResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => EnumValutesXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "EnumValutesXML"),
    :schema_element => [
      ["seld", ["SOAP::SOAPBoolean", XSD::QName.new(NsWebCbrRu, "Seld")]]
    ]
  )

  LiteralRegistry.register(
    :class => EnumValutesXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "EnumValutesXMLResponse"),
    :schema_element => [
      ["enumValutesXMLResult", ["EnumValutesXMLResponse::EnumValutesXMLResult", XSD::QName.new(NsWebCbrRu, "EnumValutesXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => EnumValutesXMLResponse::EnumValutesXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "EnumValutesXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => EnumValutes,
    :schema_name => XSD::QName.new(NsWebCbrRu, "EnumValutes"),
    :schema_element => [
      ["seld", ["SOAP::SOAPBoolean", XSD::QName.new(NsWebCbrRu, "Seld")]]
    ]
  )

  LiteralRegistry.register(
    :class => EnumValutesResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "EnumValutesResponse"),
    :schema_element => [
      ["enumValutesResult", ["EnumValutesResponse::EnumValutesResult", XSD::QName.new(NsWebCbrRu, "EnumValutesResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => EnumValutesResponse::EnumValutesResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "EnumValutesResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursDynamicXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursDynamicXML"),
    :schema_element => [
      ["fromDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "FromDate")]],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]],
      ["valutaCode", ["SOAP::SOAPString", XSD::QName.new(NsWebCbrRu, "ValutaCode")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursDynamicXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursDynamicXMLResponse"),
    :schema_element => [
      ["getCursDynamicXMLResult", ["GetCursDynamicXMLResponse::GetCursDynamicXMLResult", XSD::QName.new(NsWebCbrRu, "GetCursDynamicXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursDynamicXMLResponse::GetCursDynamicXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursDynamicXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursDynamic,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursDynamic"),
    :schema_element => [
      ["fromDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "FromDate")]],
      ["toDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "ToDate")]],
      ["valutaCode", ["SOAP::SOAPString", XSD::QName.new(NsWebCbrRu, "ValutaCode")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursDynamicResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursDynamicResponse"),
    :schema_element => [
      ["getCursDynamicResult", ["GetCursDynamicResponse::GetCursDynamicResult", XSD::QName.new(NsWebCbrRu, "GetCursDynamicResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursDynamicResponse::GetCursDynamicResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursDynamicResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursOnDateXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursOnDateXML"),
    :schema_element => [
      ["on_date", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "On_date")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursOnDateXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursOnDateXMLResponse"),
    :schema_element => [
      ["getCursOnDateXMLResult", ["GetCursOnDateXMLResponse::GetCursOnDateXMLResult", XSD::QName.new(NsWebCbrRu, "GetCursOnDateXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursOnDateXMLResponse::GetCursOnDateXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursOnDateXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetSeldCursOnDateXML,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetSeldCursOnDateXML"),
    :schema_element => [
      ["on_date", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "On_date")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetSeldCursOnDateXMLResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetSeldCursOnDateXMLResponse"),
    :schema_element => [
      ["getSeldCursOnDateXMLResult", ["GetSeldCursOnDateXMLResponse::GetSeldCursOnDateXMLResult", XSD::QName.new(NsWebCbrRu, "GetSeldCursOnDateXMLResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetSeldCursOnDateXMLResponse::GetSeldCursOnDateXMLResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetSeldCursOnDateXMLResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetSeldCursOnDate,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetSeldCursOnDate"),
    :schema_element => [
      ["on_date", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "On_date")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetSeldCursOnDateResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetSeldCursOnDateResponse"),
    :schema_element => [
      ["getSeldCursOnDateResult", ["GetSeldCursOnDateResponse::GetSeldCursOnDateResult", XSD::QName.new(NsWebCbrRu, "GetSeldCursOnDateResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetSeldCursOnDateResponse::GetSeldCursOnDateResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetSeldCursOnDateResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursOnDate,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursOnDate"),
    :schema_element => [
      ["on_date", ["SOAP::SOAPDateTime", XSD::QName.new(NsWebCbrRu, "On_date")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursOnDateResponse,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursOnDateResponse"),
    :schema_element => [
      ["getCursOnDateResult", ["GetCursOnDateResponse::GetCursOnDateResult", XSD::QName.new(NsWebCbrRu, "GetCursOnDateResult")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => GetCursOnDateResponse::GetCursOnDateResult,
    :schema_name => XSD::QName.new(NsWebCbrRu, "GetCursOnDateResult"),
    :is_anonymous => true,
    :schema_qualified => true,
    :schema_element => [
      ["any", [nil, XSD::QName.new(NsXMLSchema, "anyType")]]
    ]
  )
end
