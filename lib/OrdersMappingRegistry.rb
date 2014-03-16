require 'Orders.rb'
require 'soap/mapping'

module OrdersMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsC_192168015 = "http://192.168.0.15"

  EncodedRegistry.register(
    :class => Accounts,
    :schema_type => XSD::QName.new(NsC_192168015, "Accounts"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\235\320\276\320\274\320\265\321\200\320\241\321\207\320\265\321\202\320\260")]],
      ["v_", ["Contactors", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\321\200\320\260\320\263\320\265\320\275\321\202")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\274\320\265\321\202\320\272\320\260\320\243\320\264\320\260\320\273\320\265\320\275\320\270\321\217")]]
    ]
  )

  EncodedRegistry.register(
    :class => BuyersOrder,
    :schema_type => XSD::QName.new(NsC_192168015, "BuyersOrder"),
    :schema_element => [
      ["contractor", ["Contactors", XSD::QName.new(NsC_192168015, "Contractor")]],
      ["number", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Number")]],
      ["date", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "Date")]],
      ["deliveryPoint", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "DeliveryPoint")]],
      ["deliveryDate", ["SOAP::SOAPDate", XSD::QName.new(NsC_192168015, "DeliveryDate")]],
      ["isDelivered", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "IsDelivered")]],
      ["goods", ["TableRecord[]", XSD::QName.new(NsC_192168015, "Goods")], [0, nil]],
      ["service", ["TableService[]", XSD::QName.new(NsC_192168015, "Service")], [0, nil]],
      ["bonus", ["TableBonus[]", XSD::QName.new(NsC_192168015, "Bonus")], [0, nil]],
      ["manager", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Manager")]],
      ["warehouse", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Warehouse")]],
      ["responsible", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Responsible")]],
      ["organization", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Organization")]],
      ["agreement", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Agreement")]],
      ["comments", ["Mistakes[]", XSD::QName.new(NsC_192168015, "Comments")], [0, nil]],
      ["fromSite", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "FromSite")]]
    ]
  )

  EncodedRegistry.register(
    :class => Contactors,
    :schema_type => XSD::QName.new(NsC_192168015, "Contactors"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\230\320\235\320\235")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\235\320\260\320\270\320\274\320\265\320\275\320\276\320\262\320\260\320\275\320\270\320\265")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\264")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\242\320\270\320\277\320\236\321\202\320\275\320\276\321\210\320\265\320\275\320\270\320\271")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\232\320\237\320\237")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["Managers[]", XSD::QName.new(NsC_192168015, "\320\234\320\265\320\275\320\265\320\264\320\266\320\265\321\200\321\213")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => Contacts,
    :schema_type => XSD::QName.new(NsC_192168015, "Contacts"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\235\320\260\320\270\320\274\320\265\320\275\320\276\320\262\320\260\320\275\320\270\320\265")]],
      ["v_", ["Contactors", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\321\200\320\260\320\263\320\265\320\275\321\202")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\274\320\265\321\202\320\272\320\260\320\243\320\264\320\260\320\273\320\265\320\275\320\270\321\217")]]
    ]
  )

  EncodedRegistry.register(
    :class => DeliveryPoints,
    :schema_type => XSD::QName.new(NsC_192168015, "DeliveryPoints"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\264")]],
      ["v_", ["Contactors", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\321\200\320\260\320\263\320\265\320\275\321\202")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\274\320\265\321\202\320\272\320\260\320\243\320\264\320\260\320\273\320\265\320\275\320\270\321\217")]],
      ["v_", ["TimeTable[]", XSD::QName.new(NsC_192168015, "\320\223\321\200\320\260\321\204\320\270\320\272\320\240\320\260\320\261\320\276\321\202\321\213")], [0, nil]],
      ["v_", ["Contacts[]", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\320\260\320\272\321\202\320\275\321\213\320\265\320\233\320\270\321\206\320\260")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => Dogovors,
    :schema_type => XSD::QName.new(NsC_192168015, "Dogovors"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\235\320\260\320\270\320\274\320\265\320\275\320\276\320\262\320\260\320\275\320\270\320\265")]],
      ["v_", ["Contactors", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\321\200\320\260\320\263\320\265\320\275\321\202")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\274\320\265\321\202\320\272\320\260\320\243\320\264\320\260\320\273\320\265\320\275\320\270\321\217")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\236\321\200\320\263\320\260\320\275\320\270\320\267\320\260\321\206\320\270\321\217")]]
    ]
  )

  EncodedRegistry.register(
    :class => ListOfContactors,
    :schema_type => XSD::QName.new(NsC_192168015, "ListOfContactors"),
    :schema_element => [
      ["iNN", ["SOAP::SOAPString[]", XSD::QName.new(NsC_192168015, "INN")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => ListOfDocuments,
    :schema_type => XSD::QName.new(NsC_192168015, "ListOfDocuments"),
    :schema_element => [
      ["zakaz", ["BuyersOrder[]", XSD::QName.new(NsC_192168015, "Zakaz")], [0, nil]],
      ["vid", ["SOAP::SOAPString[]", XSD::QName.new(NsC_192168015, "Vid")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => Managers,
    :schema_type => XSD::QName.new(NsC_192168015, "Managers"),
    :schema_element => [
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\224\320\260\321\202\320\260\320\240\320\265\320\263\320\270\321\201\321\202\321\200\320\260\321\206\320\270\320\270")]],
      ["v_", ["RekvizitsSet", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\273\321\214\320\267\320\276\320\262\320\260\321\202\320\265\320\273\321\214")]]
    ]
  )

  EncodedRegistry.register(
    :class => Mistakes,
    :schema_type => XSD::QName.new(NsC_192168015, "Mistakes"),
    :schema_element => [
      ["comment", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Comment")]]
    ]
  )

  EncodedRegistry.register(
    :class => Ost,
    :schema_type => XSD::QName.new(NsC_192168015, "Ost"),
    :schema_element => [
      ["ostSet", ["OstSet[]", XSD::QName.new(NsC_192168015, "OstSet")], [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => OstSet,
    :schema_type => XSD::QName.new(NsC_192168015, "OstSet"),
    :schema_element => [
      ["goods", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Goods")]],
      ["warehouse", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Warehouse")]],
      ["remains", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Remains")]],
      ["ostatok", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Ostatok")]]
    ]
  )

  EncodedRegistry.register(
    :class => RekvizitsSet,
    :schema_type => XSD::QName.new(NsC_192168015, "RekvizitsSet"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\230\320\274\321\217\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\320\260")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\242\320\270\320\277\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\320\260")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\227\320\275\320\260\321\207\320\265\320\275\320\270\320\265\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\320\260")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\273\320\265\320\237\320\276\320\270\321\201\320\272\320\260")]]
    ]
  )

  EncodedRegistry.register(
    :class => TableBonus,
    :schema_type => XSD::QName.new(NsC_192168015, "TableBonus"),
    :schema_element => [
      ["rowNamber", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "RowNamber")]],
      ["goods", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Goods")]],
      ["countSites", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "CountSites")]],
      ["measureUnit", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "MeasureUnit")]],
      ["measureUnitSites", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "MeasureUnitSites")]],
      ["multipller", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "Multipller")]],
      ["quantity", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Quantity")]],
      ["price", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Price")]],
      ["characteristics", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Characteristics")]],
      ["seriesNomenclature", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "SeriesNomenclature")]],
      ["reserveDocument", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "ReserveDocument")]],
      ["orderCustomer", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "OrderCustomer")]],
      ["sum", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Sum")]]
    ]
  )

  EncodedRegistry.register(
    :class => TableRecord,
    :schema_type => XSD::QName.new(NsC_192168015, "TableRecord"),
    :schema_element => [
      ["rowNamber", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "RowNamber")]],
      ["goods", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Goods")]],
      ["price", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Price")]],
      ["vAT", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "VAT")]],
      ["quantity", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Quantity")]],
      ["vATAmount", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "VATAmount")]],
      ["sum", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Sum")]],
      ["measureUnit", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "MeasureUnit")]],
      ["measureUnitSites", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "MeasureUnitSites")]],
      ["countSites", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "CountSites")]],
      ["seriesNomenclature", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "SeriesNomenclature")]],
      ["characteristics", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Characteristics")]],
      ["multipller", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "Multipller")]],
      ["goodsType", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "GoodsType")]],
      ["discont", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Discont")]],
      ["forShipment", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "ForShipment")]],
      ["addExpenses", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "AddExpenses")]],
      ["shipped", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Shipped")]],
      ["remains", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Remains")]],
      ["returned", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Returned")]],
      ["inPlacing", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "InPlacing")]],
      ["ref", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Ref")]],
      ["dateDelivery", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "DateDelivery")]]
    ]
  )

  EncodedRegistry.register(
    :class => TableService,
    :schema_type => XSD::QName.new(NsC_192168015, "TableService"),
    :schema_element => [
      ["rowNamber", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "RowNamber")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Description")]],
      ["quantity", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Quantity")]],
      ["price", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Price")]],
      ["sum", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Sum")]],
      ["vat", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "Vat")]],
      ["vATAmount", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "VATAmount")]],
      ["goods", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Goods")]],
      ["discountProcent", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "DiscountProcent")]],
      ["avtoDiscountProcent", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "AvtoDiscountProcent")]],
      ["autoDiscountCondition", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "AutoDiscountCondition")]],
      ["autoDiscountConditionValue", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "AutoDiscountConditionValue")]]
    ]
  )

  EncodedRegistry.register(
    :class => TimeTable,
    :schema_type => XSD::QName.new(NsC_192168015, "TimeTable"),
    :schema_element => [
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\230\321\201\320\277\320\276\320\273\321\214\320\267\321\203\320\265\321\202\321\201\321\217")]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\222\321\213\321\205\320\276\320\264\320\275\320\276\320\271")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\235\320\260\321\207\320\260\320\273\320\260")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\236\320\272\320\276\320\275\321\207\320\260\320\275\320\270\321\217")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\237\321\200\320\265\320\261\321\213\320\262\320\260\320\275\320\270\321\217")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\236\320\261\320\265\320\264\320\260\320\241")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\236\320\261\320\265\320\264\320\260\320\237\320\276")]],
      ["v_", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "\320\235\320\276\320\274\320\265\321\200\320\241\321\202\321\200\320\276\320\272\320\270")]]
    ]
  )

  LiteralRegistry.register(
    :class => Accounts,
    :schema_type => XSD::QName.new(NsC_192168015, "Accounts"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\235\320\276\320\274\320\265\321\200\320\241\321\207\320\265\321\202\320\260")]],
      ["v_", ["Contactors", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\321\200\320\260\320\263\320\265\320\275\321\202")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\274\320\265\321\202\320\272\320\260\320\243\320\264\320\260\320\273\320\265\320\275\320\270\321\217")]]
    ]
  )

  LiteralRegistry.register(
    :class => BuyersOrder,
    :schema_type => XSD::QName.new(NsC_192168015, "BuyersOrder"),
    :schema_element => [
      ["contractor", ["Contactors", XSD::QName.new(NsC_192168015, "Contractor")]],
      ["number", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Number")]],
      ["date", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "Date")]],
      ["deliveryPoint", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "DeliveryPoint")]],
      ["deliveryDate", ["SOAP::SOAPDate", XSD::QName.new(NsC_192168015, "DeliveryDate")]],
      ["isDelivered", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "IsDelivered")]],
      ["goods", ["TableRecord[]", XSD::QName.new(NsC_192168015, "Goods")], [0, nil]],
      ["service", ["TableService[]", XSD::QName.new(NsC_192168015, "Service")], [0, nil]],
      ["bonus", ["TableBonus[]", XSD::QName.new(NsC_192168015, "Bonus")], [0, nil]],
      ["manager", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Manager")]],
      ["warehouse", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Warehouse")]],
      ["responsible", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Responsible")]],
      ["organization", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Organization")]],
      ["agreement", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Agreement")]],
      ["comments", ["Mistakes[]", XSD::QName.new(NsC_192168015, "Comments")], [0, nil]],
      ["fromSite", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "FromSite")]]
    ]
  )

  LiteralRegistry.register(
    :class => Contactors,
    :schema_type => XSD::QName.new(NsC_192168015, "Contactors"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\230\320\235\320\235")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\235\320\260\320\270\320\274\320\265\320\275\320\276\320\262\320\260\320\275\320\270\320\265")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\264")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\242\320\270\320\277\320\236\321\202\320\275\320\276\321\210\320\265\320\275\320\270\320\271")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\232\320\237\320\237")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["Managers[]", XSD::QName.new(NsC_192168015, "\320\234\320\265\320\275\320\265\320\264\320\266\320\265\321\200\321\213")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => Contacts,
    :schema_type => XSD::QName.new(NsC_192168015, "Contacts"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\235\320\260\320\270\320\274\320\265\320\275\320\276\320\262\320\260\320\275\320\270\320\265")]],
      ["v_", ["Contactors", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\321\200\320\260\320\263\320\265\320\275\321\202")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\274\320\265\321\202\320\272\320\260\320\243\320\264\320\260\320\273\320\265\320\275\320\270\321\217")]]
    ]
  )

  LiteralRegistry.register(
    :class => DeliveryPoints,
    :schema_type => XSD::QName.new(NsC_192168015, "DeliveryPoints"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\264")]],
      ["v_", ["Contactors", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\321\200\320\260\320\263\320\265\320\275\321\202")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\274\320\265\321\202\320\272\320\260\320\243\320\264\320\260\320\273\320\265\320\275\320\270\321\217")]],
      ["v_", ["TimeTable[]", XSD::QName.new(NsC_192168015, "\320\223\321\200\320\260\321\204\320\270\320\272\320\240\320\260\320\261\320\276\321\202\321\213")], [0, nil]],
      ["v_", ["Contacts[]", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\320\260\320\272\321\202\320\275\321\213\320\265\320\233\320\270\321\206\320\260")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => Dogovors,
    :schema_type => XSD::QName.new(NsC_192168015, "Dogovors"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\235\320\260\320\270\320\274\320\265\320\275\320\276\320\262\320\260\320\275\320\270\320\265")]],
      ["v_", ["Contactors", XSD::QName.new(NsC_192168015, "\320\232\320\276\320\275\321\202\321\200\320\260\320\263\320\265\320\275\321\202")]],
      ["v_", ["RekvizitsSet[]", XSD::QName.new(NsC_192168015, "\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\321\213")], [0, nil]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\274\320\265\321\202\320\272\320\260\320\243\320\264\320\260\320\273\320\265\320\275\320\270\321\217")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\236\321\200\320\263\320\260\320\275\320\270\320\267\320\260\321\206\320\270\321\217")]]
    ]
  )

  LiteralRegistry.register(
    :class => ListOfContactors,
    :schema_type => XSD::QName.new(NsC_192168015, "ListOfContactors"),
    :schema_element => [
      ["iNN", ["SOAP::SOAPString[]", XSD::QName.new(NsC_192168015, "INN")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => ListOfDocuments,
    :schema_type => XSD::QName.new(NsC_192168015, "ListOfDocuments"),
    :schema_element => [
      ["zakaz", ["BuyersOrder[]", XSD::QName.new(NsC_192168015, "Zakaz")], [0, nil]],
      ["vid", ["SOAP::SOAPString[]", XSD::QName.new(NsC_192168015, "Vid")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => Managers,
    :schema_type => XSD::QName.new(NsC_192168015, "Managers"),
    :schema_element => [
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\224\320\260\321\202\320\260\320\240\320\265\320\263\320\270\321\201\321\202\321\200\320\260\321\206\320\270\320\270")]],
      ["v_", ["RekvizitsSet", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\273\321\214\320\267\320\276\320\262\320\260\321\202\320\265\320\273\321\214")]]
    ]
  )

  LiteralRegistry.register(
    :class => Mistakes,
    :schema_type => XSD::QName.new(NsC_192168015, "Mistakes"),
    :schema_element => [
      ["comment", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Comment")]]
    ]
  )

  LiteralRegistry.register(
    :class => Ost,
    :schema_type => XSD::QName.new(NsC_192168015, "Ost"),
    :schema_element => [
      ["ostSet", ["OstSet[]", XSD::QName.new(NsC_192168015, "OstSet")], [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => OstSet,
    :schema_type => XSD::QName.new(NsC_192168015, "OstSet"),
    :schema_element => [
      ["goods", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Goods")]],
      ["warehouse", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Warehouse")]],
      ["remains", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Remains")]],
      ["ostatok", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Ostatok")]]
    ]
  )

  LiteralRegistry.register(
    :class => RekvizitsSet,
    :schema_type => XSD::QName.new(NsC_192168015, "RekvizitsSet"),
    :schema_element => [
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\230\320\274\321\217\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\320\260")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\242\320\270\320\277\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\320\260")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\227\320\275\320\260\321\207\320\265\320\275\320\270\320\265\320\240\320\265\320\272\320\262\320\270\320\267\320\270\321\202\320\260")]],
      ["v_", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "\320\237\320\276\320\273\320\265\320\237\320\276\320\270\321\201\320\272\320\260")]]
    ]
  )

  LiteralRegistry.register(
    :class => TableBonus,
    :schema_type => XSD::QName.new(NsC_192168015, "TableBonus"),
    :schema_element => [
      ["rowNamber", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "RowNamber")]],
      ["goods", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Goods")]],
      ["countSites", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "CountSites")]],
      ["measureUnit", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "MeasureUnit")]],
      ["measureUnitSites", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "MeasureUnitSites")]],
      ["multipller", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "Multipller")]],
      ["quantity", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Quantity")]],
      ["price", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Price")]],
      ["characteristics", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Characteristics")]],
      ["seriesNomenclature", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "SeriesNomenclature")]],
      ["reserveDocument", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "ReserveDocument")]],
      ["orderCustomer", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "OrderCustomer")]],
      ["sum", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Sum")]]
    ]
  )

  LiteralRegistry.register(
    :class => TableRecord,
    :schema_type => XSD::QName.new(NsC_192168015, "TableRecord"),
    :schema_element => [
      ["rowNamber", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "RowNamber")]],
      ["goods", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Goods")]],
      ["price", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Price")]],
      ["vAT", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "VAT")]],
      ["quantity", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Quantity")]],
      ["vATAmount", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "VATAmount")]],
      ["sum", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Sum")]],
      ["measureUnit", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "MeasureUnit")]],
      ["measureUnitSites", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "MeasureUnitSites")]],
      ["countSites", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "CountSites")]],
      ["seriesNomenclature", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "SeriesNomenclature")]],
      ["characteristics", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Characteristics")]],
      ["multipller", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "Multipller")]],
      ["goodsType", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "GoodsType")]],
      ["discont", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Discont")]],
      ["forShipment", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "ForShipment")]],
      ["addExpenses", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "AddExpenses")]],
      ["shipped", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Shipped")]],
      ["remains", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Remains")]],
      ["returned", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Returned")]],
      ["inPlacing", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "InPlacing")]],
      ["ref", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Ref")]],
      ["dateDelivery", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "DateDelivery")]]
    ]
  )

  LiteralRegistry.register(
    :class => TableService,
    :schema_type => XSD::QName.new(NsC_192168015, "TableService"),
    :schema_element => [
      ["rowNamber", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "RowNamber")]],
      ["description", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Description")]],
      ["quantity", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Quantity")]],
      ["price", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Price")]],
      ["sum", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "Sum")]],
      ["vat", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "Vat")]],
      ["vATAmount", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "VATAmount")]],
      ["goods", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "Goods")]],
      ["discountProcent", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "DiscountProcent")]],
      ["avtoDiscountProcent", ["SOAP::SOAPFloat", XSD::QName.new(NsC_192168015, "AvtoDiscountProcent")]],
      ["autoDiscountCondition", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "AutoDiscountCondition")]],
      ["autoDiscountConditionValue", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "AutoDiscountConditionValue")]]
    ]
  )

  LiteralRegistry.register(
    :class => TimeTable,
    :schema_type => XSD::QName.new(NsC_192168015, "TimeTable"),
    :schema_element => [
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\230\321\201\320\277\320\276\320\273\321\214\320\267\321\203\320\265\321\202\321\201\321\217")]],
      ["v_", ["SOAP::SOAPBoolean", XSD::QName.new(NsC_192168015, "\320\222\321\213\321\205\320\276\320\264\320\275\320\276\320\271")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\235\320\260\321\207\320\260\320\273\320\260")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\236\320\272\320\276\320\275\321\207\320\260\320\275\320\270\321\217")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\237\321\200\320\265\320\261\321\213\320\262\320\260\320\275\320\270\321\217")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\236\320\261\320\265\320\264\320\260\320\241")]],
      ["v_", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "\320\222\321\200\320\265\320\274\321\217\320\236\320\261\320\265\320\264\320\260\320\237\320\276")]],
      ["v_", ["SOAP::SOAPInt", XSD::QName.new(NsC_192168015, "\320\235\320\276\320\274\320\265\321\200\320\241\321\202\321\200\320\276\320\272\320\270")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewOrder,
    :schema_name => XSD::QName.new(NsC_192168015, "NewOrder"),
    :schema_element => [
      ["order", ["BuyersOrder", XSD::QName.new(NsC_192168015, "Order")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewOrderResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "NewOrderResponse"),
    :schema_element => [
      ["v_return", ["BuyersOrder", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewCorrect,
    :schema_name => XSD::QName.new(NsC_192168015, "NewCorrect"),
    :schema_element => [
      ["order", ["BuyersOrder", XSD::QName.new(NsC_192168015, "Order")]],
      ["correctNumber", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "CorrectNumber")]],
      ["correctDate", ["SOAP::SOAPDateTime", XSD::QName.new(NsC_192168015, "CorrectDate")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewCorrectResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "NewCorrectResponse"),
    :schema_element => [
      ["v_return", ["BuyersOrder", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetContactors,
    :schema_name => XSD::QName.new(NsC_192168015, "GetContactors"),
    :schema_element => []
  )

  LiteralRegistry.register(
    :class => GetContactorsResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "GetContactorsResponse"),
    :schema_element => [
      ["v_return", ["ListOfContactors", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetOrder,
    :schema_name => XSD::QName.new(NsC_192168015, "GetOrder"),
    :schema_element => [
      ["order", ["BuyersOrder", XSD::QName.new(NsC_192168015, "Order")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetOrderResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "GetOrderResponse"),
    :schema_element => [
      ["v_return", ["BuyersOrder", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewContactors,
    :schema_name => XSD::QName.new(NsC_192168015, "NewContactors"),
    :schema_element => [
      ["contactor", ["Contactors", XSD::QName.new(NsC_192168015, "Contactor")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewContactorsResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "NewContactorsResponse"),
    :schema_element => [
      ["v_return", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewContacts,
    :schema_name => XSD::QName.new(NsC_192168015, "NewContacts"),
    :schema_element => [
      ["contact", ["Contacts", XSD::QName.new(NsC_192168015, "Contact")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewContactsResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "NewContactsResponse"),
    :schema_element => [
      ["v_return", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewAccount,
    :schema_name => XSD::QName.new(NsC_192168015, "NewAccount"),
    :schema_element => [
      ["account", ["Accounts", XSD::QName.new(NsC_192168015, "Account")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewAccountResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "NewAccountResponse"),
    :schema_element => [
      ["v_return", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewDogovor,
    :schema_name => XSD::QName.new(NsC_192168015, "NewDogovor"),
    :schema_element => [
      ["dogovor", ["Dogovors", XSD::QName.new(NsC_192168015, "Dogovor")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewDogovorResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "NewDogovorResponse"),
    :schema_element => [
      ["v_return", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewPoint,
    :schema_name => XSD::QName.new(NsC_192168015, "NewPoint"),
    :schema_element => [
      ["deliveryPoints", ["DeliveryPoints", XSD::QName.new(NsC_192168015, "DeliveryPoints")]]
    ]
  )

  LiteralRegistry.register(
    :class => NewPointResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "NewPointResponse"),
    :schema_element => [
      ["v_return", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetOstatok,
    :schema_name => XSD::QName.new(NsC_192168015, "GetOstatok"),
    :schema_element => [
      ["ost", ["Ost", XSD::QName.new(NsC_192168015, "Ost")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetOstatokResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "GetOstatokResponse"),
    :schema_element => [
      ["v_return", ["Ost", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetDocuments,
    :schema_name => XSD::QName.new(NsC_192168015, "GetDocuments"),
    :schema_element => [
      ["contactorsCode", ["SOAP::SOAPString", XSD::QName.new(NsC_192168015, "ContactorsCode")]],
      ["quantity", ["SOAP::SOAPInteger", XSD::QName.new(NsC_192168015, "Quantity")]]
    ]
  )

  LiteralRegistry.register(
    :class => GetDocumentsResponse,
    :schema_name => XSD::QName.new(NsC_192168015, "GetDocumentsResponse"),
    :schema_element => [
      ["v_return", ["ListOfDocuments", XSD::QName.new(NsC_192168015, "return")]]
    ]
  )
end
