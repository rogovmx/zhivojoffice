require 'xsd/qname'

# {http://web.cbr.ru/}SaldoXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class SaldoXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}SaldoXMLResponse
#   saldoXMLResult - SaldoXMLResponse::SaldoXMLResult
class SaldoXMLResponse

  # inner class for member: SaldoXMLResult
  # {http://web.cbr.ru/}SaldoXMLResult
  class SaldoXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :saldoXMLResult

  def initialize(saldoXMLResult = nil)
    @saldoXMLResult = saldoXMLResult
  end
end

# {http://web.cbr.ru/}mrrf7D
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class Mrrf7D
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}mrrf7DResponse
#   mrrf7DResult - Mrrf7DResponse::Mrrf7DResult
class Mrrf7DResponse

  # inner class for member: mrrf7DResult
  # {http://web.cbr.ru/}mrrf7DResult
  class Mrrf7DResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :mrrf7DResult

  def initialize(mrrf7DResult = nil)
    @mrrf7DResult = mrrf7DResult
  end
end

# {http://web.cbr.ru/}mrrf7DXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class Mrrf7DXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}mrrf7DXMLResponse
#   mrrf7DXMLResult - Mrrf7DXMLResponse::Mrrf7DXMLResult
class Mrrf7DXMLResponse

  # inner class for member: mrrf7DXMLResult
  # {http://web.cbr.ru/}mrrf7DXMLResult
  class Mrrf7DXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :mrrf7DXMLResult

  def initialize(mrrf7DXMLResult = nil)
    @mrrf7DXMLResult = mrrf7DXMLResult
  end
end

# {http://web.cbr.ru/}mrrf
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class Mrrf
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}mrrfResponse
#   mrrfResult - MrrfResponse::MrrfResult
class MrrfResponse

  # inner class for member: mrrfResult
  # {http://web.cbr.ru/}mrrfResult
  class MrrfResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :mrrfResult

  def initialize(mrrfResult = nil)
    @mrrfResult = mrrfResult
  end
end

# {http://web.cbr.ru/}mrrfXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class MrrfXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}mrrfXMLResponse
#   mrrfXMLResult - MrrfXMLResponse::MrrfXMLResult
class MrrfXMLResponse

  # inner class for member: mrrfXMLResult
  # {http://web.cbr.ru/}mrrfXMLResult
  class MrrfXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :mrrfXMLResult

  def initialize(mrrfXMLResult = nil)
    @mrrfXMLResult = mrrfXMLResult
  end
end

# {http://web.cbr.ru/}Saldo
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class Saldo
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}SaldoResponse
#   saldoResult - SaldoResponse::SaldoResult
class SaldoResponse

  # inner class for member: SaldoResult
  # {http://web.cbr.ru/}SaldoResult
  class SaldoResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :saldoResult

  def initialize(saldoResult = nil)
    @saldoResult = saldoResult
  end
end

# {http://web.cbr.ru/}NewsInfoXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class NewsInfoXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}NewsInfoXMLResponse
#   newsInfoXMLResult - NewsInfoXMLResponse::NewsInfoXMLResult
class NewsInfoXMLResponse

  # inner class for member: NewsInfoXMLResult
  # {http://web.cbr.ru/}NewsInfoXMLResult
  class NewsInfoXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :newsInfoXMLResult

  def initialize(newsInfoXMLResult = nil)
    @newsInfoXMLResult = newsInfoXMLResult
  end
end

# {http://web.cbr.ru/}OmodInfoXML
class OmodInfoXML
  def initialize
  end
end

# {http://web.cbr.ru/}OmodInfoXMLResponse
#   omodInfoXMLResult - OmodInfoXMLResponse::OmodInfoXMLResult
class OmodInfoXMLResponse

  # inner class for member: OmodInfoXMLResult
  # {http://web.cbr.ru/}OmodInfoXMLResult
  class OmodInfoXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :omodInfoXMLResult

  def initialize(omodInfoXMLResult = nil)
    @omodInfoXMLResult = omodInfoXMLResult
  end
end

# {http://web.cbr.ru/}XVol
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class XVol
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}XVolResponse
#   xVolResult - XVolResponse::XVolResult
class XVolResponse

  # inner class for member: XVolResult
  # {http://web.cbr.ru/}XVolResult
  class XVolResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xVolResult

  def initialize(xVolResult = nil)
    @xVolResult = xVolResult
  end
end

# {http://web.cbr.ru/}XVolXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class XVolXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}XVolXMLResponse
#   xVolXMLResult - XVolXMLResponse::XVolXMLResult
class XVolXMLResponse

  # inner class for member: XVolXMLResult
  # {http://web.cbr.ru/}XVolXMLResult
  class XVolXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :xVolXMLResult

  def initialize(xVolXMLResult = nil)
    @xVolXMLResult = xVolXMLResult
  end
end

# {http://web.cbr.ru/}MainInfoXML
class MainInfoXML
  def initialize
  end
end

# {http://web.cbr.ru/}MainInfoXMLResponse
#   mainInfoXMLResult - MainInfoXMLResponse::MainInfoXMLResult
class MainInfoXMLResponse

  # inner class for member: MainInfoXMLResult
  # {http://web.cbr.ru/}MainInfoXMLResult
  class MainInfoXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :mainInfoXMLResult

  def initialize(mainInfoXMLResult = nil)
    @mainInfoXMLResult = mainInfoXMLResult
  end
end

# {http://web.cbr.ru/}AllDataInfoXML
class AllDataInfoXML
  def initialize
  end
end

# {http://web.cbr.ru/}AllDataInfoXMLResponse
#   allDataInfoXMLResult - AllDataInfoXMLResponse::AllDataInfoXMLResult
class AllDataInfoXMLResponse

  # inner class for member: AllDataInfoXMLResult
  # {http://web.cbr.ru/}AllDataInfoXMLResult
  class AllDataInfoXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :allDataInfoXMLResult

  def initialize(allDataInfoXMLResult = nil)
    @allDataInfoXMLResult = allDataInfoXMLResult
  end
end

# {http://web.cbr.ru/}NewsInfo
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class NewsInfo
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}NewsInfoResponse
#   newsInfoResult - NewsInfoResponse::NewsInfoResult
class NewsInfoResponse

  # inner class for member: NewsInfoResult
  # {http://web.cbr.ru/}NewsInfoResult
  class NewsInfoResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :newsInfoResult

  def initialize(newsInfoResult = nil)
    @newsInfoResult = newsInfoResult
  end
end

# {http://web.cbr.ru/}SwapDynamicXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class SwapDynamicXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}SwapDynamicXMLResponse
#   swapDynamicXMLResult - SwapDynamicXMLResponse::SwapDynamicXMLResult
class SwapDynamicXMLResponse

  # inner class for member: SwapDynamicXMLResult
  # {http://web.cbr.ru/}SwapDynamicXMLResult
  class SwapDynamicXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :swapDynamicXMLResult

  def initialize(swapDynamicXMLResult = nil)
    @swapDynamicXMLResult = swapDynamicXMLResult
  end
end

# {http://web.cbr.ru/}SwapDynamic
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class SwapDynamic
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}SwapDynamicResponse
#   swapDynamicResult - SwapDynamicResponse::SwapDynamicResult
class SwapDynamicResponse

  # inner class for member: SwapDynamicResult
  # {http://web.cbr.ru/}SwapDynamicResult
  class SwapDynamicResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :swapDynamicResult

  def initialize(swapDynamicResult = nil)
    @swapDynamicResult = swapDynamicResult
  end
end

# {http://web.cbr.ru/}DepoDynamicXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class DepoDynamicXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}DepoDynamicXMLResponse
#   depoDynamicXMLResult - DepoDynamicXMLResponse::DepoDynamicXMLResult
class DepoDynamicXMLResponse

  # inner class for member: DepoDynamicXMLResult
  # {http://web.cbr.ru/}DepoDynamicXMLResult
  class DepoDynamicXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :depoDynamicXMLResult

  def initialize(depoDynamicXMLResult = nil)
    @depoDynamicXMLResult = depoDynamicXMLResult
  end
end

# {http://web.cbr.ru/}DepoDynamic
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class DepoDynamic
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}DepoDynamicResponse
#   depoDynamicResult - DepoDynamicResponse::DepoDynamicResult
class DepoDynamicResponse

  # inner class for member: DepoDynamicResult
  # {http://web.cbr.ru/}DepoDynamicResult
  class DepoDynamicResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :depoDynamicResult

  def initialize(depoDynamicResult = nil)
    @depoDynamicResult = depoDynamicResult
  end
end

# {http://web.cbr.ru/}OstatDynamicXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class OstatDynamicXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}OstatDynamicXMLResponse
#   ostatDynamicXMLResult - OstatDynamicXMLResponse::OstatDynamicXMLResult
class OstatDynamicXMLResponse

  # inner class for member: OstatDynamicXMLResult
  # {http://web.cbr.ru/}OstatDynamicXMLResult
  class OstatDynamicXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :ostatDynamicXMLResult

  def initialize(ostatDynamicXMLResult = nil)
    @ostatDynamicXMLResult = ostatDynamicXMLResult
  end
end

# {http://web.cbr.ru/}OstatDynamic
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class OstatDynamic
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}OstatDynamicResponse
#   ostatDynamicResult - OstatDynamicResponse::OstatDynamicResult
class OstatDynamicResponse

  # inner class for member: OstatDynamicResult
  # {http://web.cbr.ru/}OstatDynamicResult
  class OstatDynamicResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :ostatDynamicResult

  def initialize(ostatDynamicResult = nil)
    @ostatDynamicResult = ostatDynamicResult
  end
end

# {http://web.cbr.ru/}DragMetDynamicXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class DragMetDynamicXML
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}DragMetDynamicXMLResponse
#   dragMetDynamicXMLResult - DragMetDynamicXMLResponse::DragMetDynamicXMLResult
class DragMetDynamicXMLResponse

  # inner class for member: DragMetDynamicXMLResult
  # {http://web.cbr.ru/}DragMetDynamicXMLResult
  class DragMetDynamicXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :dragMetDynamicXMLResult

  def initialize(dragMetDynamicXMLResult = nil)
    @dragMetDynamicXMLResult = dragMetDynamicXMLResult
  end
end

# {http://web.cbr.ru/}DragMetDynamic
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
class DragMetDynamic
  attr_accessor :fromDate
  attr_accessor :toDate

  def initialize(fromDate = nil, toDate = nil)
    @fromDate = fromDate
    @toDate = toDate
  end
end

# {http://web.cbr.ru/}DragMetDynamicResponse
#   dragMetDynamicResult - DragMetDynamicResponse::DragMetDynamicResult
class DragMetDynamicResponse

  # inner class for member: DragMetDynamicResult
  # {http://web.cbr.ru/}DragMetDynamicResult
  class DragMetDynamicResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :dragMetDynamicResult

  def initialize(dragMetDynamicResult = nil)
    @dragMetDynamicResult = dragMetDynamicResult
  end
end

# {http://web.cbr.ru/}GetLatestDateTime
class GetLatestDateTime
  def initialize
  end
end

# {http://web.cbr.ru/}GetLatestDateTimeResponse
#   getLatestDateTimeResult - SOAP::SOAPDateTime
class GetLatestDateTimeResponse
  attr_accessor :getLatestDateTimeResult

  def initialize(getLatestDateTimeResult = nil)
    @getLatestDateTimeResult = getLatestDateTimeResult
  end
end

# {http://web.cbr.ru/}GetLatestDate
class GetLatestDate
  def initialize
  end
end

# {http://web.cbr.ru/}GetLatestDateResponse
#   getLatestDateResult - SOAP::SOAPString
class GetLatestDateResponse
  attr_accessor :getLatestDateResult

  def initialize(getLatestDateResult = nil)
    @getLatestDateResult = getLatestDateResult
  end
end

# {http://web.cbr.ru/}GetLatestDateTimeSeld
class GetLatestDateTimeSeld
  def initialize
  end
end

# {http://web.cbr.ru/}GetLatestDateTimeSeldResponse
#   getLatestDateTimeSeldResult - SOAP::SOAPDateTime
class GetLatestDateTimeSeldResponse
  attr_accessor :getLatestDateTimeSeldResult

  def initialize(getLatestDateTimeSeldResult = nil)
    @getLatestDateTimeSeldResult = getLatestDateTimeSeldResult
  end
end

# {http://web.cbr.ru/}GetLatestDateSeld
class GetLatestDateSeld
  def initialize
  end
end

# {http://web.cbr.ru/}GetLatestDateSeldResponse
#   getLatestDateSeldResult - SOAP::SOAPString
class GetLatestDateSeldResponse
  attr_accessor :getLatestDateSeldResult

  def initialize(getLatestDateSeldResult = nil)
    @getLatestDateSeldResult = getLatestDateSeldResult
  end
end

# {http://web.cbr.ru/}EnumValutesXML
#   seld - SOAP::SOAPBoolean
class EnumValutesXML
  attr_accessor :seld

  def initialize(seld = nil)
    @seld = seld
  end
end

# {http://web.cbr.ru/}EnumValutesXMLResponse
#   enumValutesXMLResult - EnumValutesXMLResponse::EnumValutesXMLResult
class EnumValutesXMLResponse

  # inner class for member: EnumValutesXMLResult
  # {http://web.cbr.ru/}EnumValutesXMLResult
  class EnumValutesXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :enumValutesXMLResult

  def initialize(enumValutesXMLResult = nil)
    @enumValutesXMLResult = enumValutesXMLResult
  end
end

# {http://web.cbr.ru/}EnumValutes
#   seld - SOAP::SOAPBoolean
class EnumValutes
  attr_accessor :seld

  def initialize(seld = nil)
    @seld = seld
  end
end

# {http://web.cbr.ru/}EnumValutesResponse
#   enumValutesResult - EnumValutesResponse::EnumValutesResult
class EnumValutesResponse

  # inner class for member: EnumValutesResult
  # {http://web.cbr.ru/}EnumValutesResult
  class EnumValutesResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :enumValutesResult

  def initialize(enumValutesResult = nil)
    @enumValutesResult = enumValutesResult
  end
end

# {http://web.cbr.ru/}GetCursDynamicXML
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
#   valutaCode - SOAP::SOAPString
class GetCursDynamicXML
  attr_accessor :fromDate
  attr_accessor :toDate
  attr_accessor :valutaCode

  def initialize(fromDate = nil, toDate = nil, valutaCode = nil)
    @fromDate = fromDate
    @toDate = toDate
    @valutaCode = valutaCode
  end
end

# {http://web.cbr.ru/}GetCursDynamicXMLResponse
#   getCursDynamicXMLResult - GetCursDynamicXMLResponse::GetCursDynamicXMLResult
class GetCursDynamicXMLResponse

  # inner class for member: GetCursDynamicXMLResult
  # {http://web.cbr.ru/}GetCursDynamicXMLResult
  class GetCursDynamicXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getCursDynamicXMLResult

  def initialize(getCursDynamicXMLResult = nil)
    @getCursDynamicXMLResult = getCursDynamicXMLResult
  end
end

# {http://web.cbr.ru/}GetCursDynamic
#   fromDate - SOAP::SOAPDateTime
#   toDate - SOAP::SOAPDateTime
#   valutaCode - SOAP::SOAPString
class GetCursDynamic
  attr_accessor :fromDate
  attr_accessor :toDate
  attr_accessor :valutaCode

  def initialize(fromDate = nil, toDate = nil, valutaCode = nil)
    @fromDate = fromDate
    @toDate = toDate
    @valutaCode = valutaCode
  end
end

# {http://web.cbr.ru/}GetCursDynamicResponse
#   getCursDynamicResult - GetCursDynamicResponse::GetCursDynamicResult
class GetCursDynamicResponse

  # inner class for member: GetCursDynamicResult
  # {http://web.cbr.ru/}GetCursDynamicResult
  class GetCursDynamicResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getCursDynamicResult

  def initialize(getCursDynamicResult = nil)
    @getCursDynamicResult = getCursDynamicResult
  end
end

# {http://web.cbr.ru/}GetCursOnDateXML
#   on_date - SOAP::SOAPDateTime
class GetCursOnDateXML
  attr_accessor :on_date

  def initialize(on_date = nil)
    @on_date = on_date
  end
end

# {http://web.cbr.ru/}GetCursOnDateXMLResponse
#   getCursOnDateXMLResult - GetCursOnDateXMLResponse::GetCursOnDateXMLResult
class GetCursOnDateXMLResponse

  # inner class for member: GetCursOnDateXMLResult
  # {http://web.cbr.ru/}GetCursOnDateXMLResult
  class GetCursOnDateXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getCursOnDateXMLResult

  def initialize(getCursOnDateXMLResult = nil)
    @getCursOnDateXMLResult = getCursOnDateXMLResult
  end
end

# {http://web.cbr.ru/}GetSeldCursOnDateXML
#   on_date - SOAP::SOAPDateTime
class GetSeldCursOnDateXML
  attr_accessor :on_date

  def initialize(on_date = nil)
    @on_date = on_date
  end
end

# {http://web.cbr.ru/}GetSeldCursOnDateXMLResponse
#   getSeldCursOnDateXMLResult - GetSeldCursOnDateXMLResponse::GetSeldCursOnDateXMLResult
class GetSeldCursOnDateXMLResponse

  # inner class for member: GetSeldCursOnDateXMLResult
  # {http://web.cbr.ru/}GetSeldCursOnDateXMLResult
  class GetSeldCursOnDateXMLResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getSeldCursOnDateXMLResult

  def initialize(getSeldCursOnDateXMLResult = nil)
    @getSeldCursOnDateXMLResult = getSeldCursOnDateXMLResult
  end
end

# {http://web.cbr.ru/}GetSeldCursOnDate
#   on_date - SOAP::SOAPDateTime
class GetSeldCursOnDate
  attr_accessor :on_date

  def initialize(on_date = nil)
    @on_date = on_date
  end
end

# {http://web.cbr.ru/}GetSeldCursOnDateResponse
#   getSeldCursOnDateResult - GetSeldCursOnDateResponse::GetSeldCursOnDateResult
class GetSeldCursOnDateResponse

  # inner class for member: GetSeldCursOnDateResult
  # {http://web.cbr.ru/}GetSeldCursOnDateResult
  class GetSeldCursOnDateResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getSeldCursOnDateResult

  def initialize(getSeldCursOnDateResult = nil)
    @getSeldCursOnDateResult = getSeldCursOnDateResult
  end
end

# {http://web.cbr.ru/}GetCursOnDate
#   on_date - SOAP::SOAPDateTime
class GetCursOnDate
  attr_accessor :on_date

  def initialize(on_date = nil)
    @on_date = on_date
  end
end

# {http://web.cbr.ru/}GetCursOnDateResponse
#   getCursOnDateResult - GetCursOnDateResponse::GetCursOnDateResult
class GetCursOnDateResponse

  # inner class for member: GetCursOnDateResult
  # {http://web.cbr.ru/}GetCursOnDateResult
  class GetCursOnDateResult
    attr_reader :__xmlele_any

    def set_any(elements)
      @__xmlele_any = elements
    end

    def initialize
      @__xmlele_any = nil
    end
  end

  attr_accessor :getCursOnDateResult

  def initialize(getCursOnDateResult = nil)
    @getCursOnDateResult = getCursOnDateResult
  end
end
