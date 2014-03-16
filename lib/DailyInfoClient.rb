#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = DailyInfoSoap.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   SaldoXML(parameters)
#
# ARGS
#   parameters      SaldoXML - {http://web.cbr.ru/}SaldoXML
#
# RETURNS
#   parameters      SaldoXMLResponse - {http://web.cbr.ru/}SaldoXMLResponse
#
parameters = nil
puts obj.saldoXML(parameters)

# SYNOPSIS
#   mrrf7D(parameters)
#
# ARGS
#   parameters      Mrrf7D - {http://web.cbr.ru/}mrrf7D
#
# RETURNS
#   parameters      Mrrf7DResponse - {http://web.cbr.ru/}mrrf7DResponse
#
parameters = nil
puts obj.mrrf7D(parameters)

# SYNOPSIS
#   mrrf7DXML(parameters)
#
# ARGS
#   parameters      Mrrf7DXML - {http://web.cbr.ru/}mrrf7DXML
#
# RETURNS
#   parameters      Mrrf7DXMLResponse - {http://web.cbr.ru/}mrrf7DXMLResponse
#
parameters = nil
puts obj.mrrf7DXML(parameters)

# SYNOPSIS
#   mrrf(parameters)
#
# ARGS
#   parameters      Mrrf - {http://web.cbr.ru/}mrrf
#
# RETURNS
#   parameters      MrrfResponse - {http://web.cbr.ru/}mrrfResponse
#
parameters = nil
puts obj.mrrf(parameters)

# SYNOPSIS
#   mrrfXML(parameters)
#
# ARGS
#   parameters      MrrfXML - {http://web.cbr.ru/}mrrfXML
#
# RETURNS
#   parameters      MrrfXMLResponse - {http://web.cbr.ru/}mrrfXMLResponse
#
parameters = nil
puts obj.mrrfXML(parameters)

# SYNOPSIS
#   Saldo(parameters)
#
# ARGS
#   parameters      Saldo - {http://web.cbr.ru/}Saldo
#
# RETURNS
#   parameters      SaldoResponse - {http://web.cbr.ru/}SaldoResponse
#
parameters = nil
puts obj.saldo(parameters)

# SYNOPSIS
#   NewsInfoXML(parameters)
#
# ARGS
#   parameters      NewsInfoXML - {http://web.cbr.ru/}NewsInfoXML
#
# RETURNS
#   parameters      NewsInfoXMLResponse - {http://web.cbr.ru/}NewsInfoXMLResponse
#
parameters = nil
puts obj.newsInfoXML(parameters)

# SYNOPSIS
#   OmodInfoXML(parameters)
#
# ARGS
#   parameters      OmodInfoXML - {http://web.cbr.ru/}OmodInfoXML
#
# RETURNS
#   parameters      OmodInfoXMLResponse - {http://web.cbr.ru/}OmodInfoXMLResponse
#
parameters = nil
puts obj.omodInfoXML(parameters)

# SYNOPSIS
#   XVol(parameters)
#
# ARGS
#   parameters      XVol - {http://web.cbr.ru/}XVol
#
# RETURNS
#   parameters      XVolResponse - {http://web.cbr.ru/}XVolResponse
#
parameters = nil
puts obj.xVol(parameters)

# SYNOPSIS
#   XVolXML(parameters)
#
# ARGS
#   parameters      XVolXML - {http://web.cbr.ru/}XVolXML
#
# RETURNS
#   parameters      XVolXMLResponse - {http://web.cbr.ru/}XVolXMLResponse
#
parameters = nil
puts obj.xVolXML(parameters)

# SYNOPSIS
#   MainInfoXML(parameters)
#
# ARGS
#   parameters      MainInfoXML - {http://web.cbr.ru/}MainInfoXML
#
# RETURNS
#   parameters      MainInfoXMLResponse - {http://web.cbr.ru/}MainInfoXMLResponse
#
parameters = nil
puts obj.mainInfoXML(parameters)

# SYNOPSIS
#   AllDataInfoXML(parameters)
#
# ARGS
#   parameters      AllDataInfoXML - {http://web.cbr.ru/}AllDataInfoXML
#
# RETURNS
#   parameters      AllDataInfoXMLResponse - {http://web.cbr.ru/}AllDataInfoXMLResponse
#
parameters = nil
puts obj.allDataInfoXML(parameters)

# SYNOPSIS
#   NewsInfo(parameters)
#
# ARGS
#   parameters      NewsInfo - {http://web.cbr.ru/}NewsInfo
#
# RETURNS
#   parameters      NewsInfoResponse - {http://web.cbr.ru/}NewsInfoResponse
#
parameters = nil
puts obj.newsInfo(parameters)

# SYNOPSIS
#   SwapDynamicXML(parameters)
#
# ARGS
#   parameters      SwapDynamicXML - {http://web.cbr.ru/}SwapDynamicXML
#
# RETURNS
#   parameters      SwapDynamicXMLResponse - {http://web.cbr.ru/}SwapDynamicXMLResponse
#
parameters = nil
puts obj.swapDynamicXML(parameters)

# SYNOPSIS
#   SwapDynamic(parameters)
#
# ARGS
#   parameters      SwapDynamic - {http://web.cbr.ru/}SwapDynamic
#
# RETURNS
#   parameters      SwapDynamicResponse - {http://web.cbr.ru/}SwapDynamicResponse
#
parameters = nil
puts obj.swapDynamic(parameters)

# SYNOPSIS
#   DepoDynamicXML(parameters)
#
# ARGS
#   parameters      DepoDynamicXML - {http://web.cbr.ru/}DepoDynamicXML
#
# RETURNS
#   parameters      DepoDynamicXMLResponse - {http://web.cbr.ru/}DepoDynamicXMLResponse
#
parameters = nil
puts obj.depoDynamicXML(parameters)

# SYNOPSIS
#   DepoDynamic(parameters)
#
# ARGS
#   parameters      DepoDynamic - {http://web.cbr.ru/}DepoDynamic
#
# RETURNS
#   parameters      DepoDynamicResponse - {http://web.cbr.ru/}DepoDynamicResponse
#
parameters = nil
puts obj.depoDynamic(parameters)

# SYNOPSIS
#   OstatDynamicXML(parameters)
#
# ARGS
#   parameters      OstatDynamicXML - {http://web.cbr.ru/}OstatDynamicXML
#
# RETURNS
#   parameters      OstatDynamicXMLResponse - {http://web.cbr.ru/}OstatDynamicXMLResponse
#
parameters = nil
puts obj.ostatDynamicXML(parameters)

# SYNOPSIS
#   OstatDynamic(parameters)
#
# ARGS
#   parameters      OstatDynamic - {http://web.cbr.ru/}OstatDynamic
#
# RETURNS
#   parameters      OstatDynamicResponse - {http://web.cbr.ru/}OstatDynamicResponse
#
parameters = nil
puts obj.ostatDynamic(parameters)

# SYNOPSIS
#   DragMetDynamicXML(parameters)
#
# ARGS
#   parameters      DragMetDynamicXML - {http://web.cbr.ru/}DragMetDynamicXML
#
# RETURNS
#   parameters      DragMetDynamicXMLResponse - {http://web.cbr.ru/}DragMetDynamicXMLResponse
#
parameters = nil
puts obj.dragMetDynamicXML(parameters)

# SYNOPSIS
#   DragMetDynamic(parameters)
#
# ARGS
#   parameters      DragMetDynamic - {http://web.cbr.ru/}DragMetDynamic
#
# RETURNS
#   parameters      DragMetDynamicResponse - {http://web.cbr.ru/}DragMetDynamicResponse
#
parameters = nil
puts obj.dragMetDynamic(parameters)

# SYNOPSIS
#   GetLatestDateTime(parameters)
#
# ARGS
#   parameters      GetLatestDateTime - {http://web.cbr.ru/}GetLatestDateTime
#
# RETURNS
#   parameters      GetLatestDateTimeResponse - {http://web.cbr.ru/}GetLatestDateTimeResponse
#
parameters = nil
puts obj.getLatestDateTime(parameters)

# SYNOPSIS
#   GetLatestDate(parameters)
#
# ARGS
#   parameters      GetLatestDate - {http://web.cbr.ru/}GetLatestDate
#
# RETURNS
#   parameters      GetLatestDateResponse - {http://web.cbr.ru/}GetLatestDateResponse
#
parameters = nil
puts obj.getLatestDate(parameters)

# SYNOPSIS
#   GetLatestDateTimeSeld(parameters)
#
# ARGS
#   parameters      GetLatestDateTimeSeld - {http://web.cbr.ru/}GetLatestDateTimeSeld
#
# RETURNS
#   parameters      GetLatestDateTimeSeldResponse - {http://web.cbr.ru/}GetLatestDateTimeSeldResponse
#
parameters = nil
puts obj.getLatestDateTimeSeld(parameters)

# SYNOPSIS
#   GetLatestDateSeld(parameters)
#
# ARGS
#   parameters      GetLatestDateSeld - {http://web.cbr.ru/}GetLatestDateSeld
#
# RETURNS
#   parameters      GetLatestDateSeldResponse - {http://web.cbr.ru/}GetLatestDateSeldResponse
#
parameters = nil
puts obj.getLatestDateSeld(parameters)

# SYNOPSIS
#   EnumValutesXML(parameters)
#
# ARGS
#   parameters      EnumValutesXML - {http://web.cbr.ru/}EnumValutesXML
#
# RETURNS
#   parameters      EnumValutesXMLResponse - {http://web.cbr.ru/}EnumValutesXMLResponse
#
parameters = nil
puts obj.enumValutesXML(parameters)

# SYNOPSIS
#   EnumValutes(parameters)
#
# ARGS
#   parameters      EnumValutes - {http://web.cbr.ru/}EnumValutes
#
# RETURNS
#   parameters      EnumValutesResponse - {http://web.cbr.ru/}EnumValutesResponse
#
parameters = nil
puts obj.enumValutes(parameters)

# SYNOPSIS
#   GetCursDynamicXML(parameters)
#
# ARGS
#   parameters      GetCursDynamicXML - {http://web.cbr.ru/}GetCursDynamicXML
#
# RETURNS
#   parameters      GetCursDynamicXMLResponse - {http://web.cbr.ru/}GetCursDynamicXMLResponse
#
parameters = nil
puts obj.getCursDynamicXML(parameters)

# SYNOPSIS
#   GetCursDynamic(parameters)
#
# ARGS
#   parameters      GetCursDynamic - {http://web.cbr.ru/}GetCursDynamic
#
# RETURNS
#   parameters      GetCursDynamicResponse - {http://web.cbr.ru/}GetCursDynamicResponse
#
parameters = nil
puts obj.getCursDynamic(parameters)

# SYNOPSIS
#   GetCursOnDateXML(parameters)
#
# ARGS
#   parameters      GetCursOnDateXML - {http://web.cbr.ru/}GetCursOnDateXML
#
# RETURNS
#   parameters      GetCursOnDateXMLResponse - {http://web.cbr.ru/}GetCursOnDateXMLResponse
#
parameters = nil
puts obj.getCursOnDateXML(parameters)

# SYNOPSIS
#   GetSeldCursOnDateXML(parameters)
#
# ARGS
#   parameters      GetSeldCursOnDateXML - {http://web.cbr.ru/}GetSeldCursOnDateXML
#
# RETURNS
#   parameters      GetSeldCursOnDateXMLResponse - {http://web.cbr.ru/}GetSeldCursOnDateXMLResponse
#
parameters = nil
puts obj.getSeldCursOnDateXML(parameters)

# SYNOPSIS
#   GetSeldCursOnDate(parameters)
#
# ARGS
#   parameters      GetSeldCursOnDate - {http://web.cbr.ru/}GetSeldCursOnDate
#
# RETURNS
#   parameters      GetSeldCursOnDateResponse - {http://web.cbr.ru/}GetSeldCursOnDateResponse
#
parameters = nil
puts obj.getSeldCursOnDate(parameters)

# SYNOPSIS
#   GetCursOnDate(parameters)
#
# ARGS
#   parameters      GetCursOnDate - {http://web.cbr.ru/}GetCursOnDate
#
# RETURNS
#   parameters      GetCursOnDateResponse - {http://web.cbr.ru/}GetCursOnDateResponse
#
parameters = nil
puts obj.getCursOnDate(parameters)


endpoint_url = ARGV.shift
obj = DailyInfoSoap.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   SaldoXML(parameters)
#
# ARGS
#   parameters      SaldoXML - {http://web.cbr.ru/}SaldoXML
#
# RETURNS
#   parameters      SaldoXMLResponse - {http://web.cbr.ru/}SaldoXMLResponse
#
parameters = nil
puts obj.saldoXML(parameters)

# SYNOPSIS
#   mrrf7D(parameters)
#
# ARGS
#   parameters      Mrrf7D - {http://web.cbr.ru/}mrrf7D
#
# RETURNS
#   parameters      Mrrf7DResponse - {http://web.cbr.ru/}mrrf7DResponse
#
parameters = nil
puts obj.mrrf7D(parameters)

# SYNOPSIS
#   mrrf7DXML(parameters)
#
# ARGS
#   parameters      Mrrf7DXML - {http://web.cbr.ru/}mrrf7DXML
#
# RETURNS
#   parameters      Mrrf7DXMLResponse - {http://web.cbr.ru/}mrrf7DXMLResponse
#
parameters = nil
puts obj.mrrf7DXML(parameters)

# SYNOPSIS
#   mrrf(parameters)
#
# ARGS
#   parameters      Mrrf - {http://web.cbr.ru/}mrrf
#
# RETURNS
#   parameters      MrrfResponse - {http://web.cbr.ru/}mrrfResponse
#
parameters = nil
puts obj.mrrf(parameters)

# SYNOPSIS
#   mrrfXML(parameters)
#
# ARGS
#   parameters      MrrfXML - {http://web.cbr.ru/}mrrfXML
#
# RETURNS
#   parameters      MrrfXMLResponse - {http://web.cbr.ru/}mrrfXMLResponse
#
parameters = nil
puts obj.mrrfXML(parameters)

# SYNOPSIS
#   Saldo(parameters)
#
# ARGS
#   parameters      Saldo - {http://web.cbr.ru/}Saldo
#
# RETURNS
#   parameters      SaldoResponse - {http://web.cbr.ru/}SaldoResponse
#
parameters = nil
puts obj.saldo(parameters)

# SYNOPSIS
#   NewsInfoXML(parameters)
#
# ARGS
#   parameters      NewsInfoXML - {http://web.cbr.ru/}NewsInfoXML
#
# RETURNS
#   parameters      NewsInfoXMLResponse - {http://web.cbr.ru/}NewsInfoXMLResponse
#
parameters = nil
puts obj.newsInfoXML(parameters)

# SYNOPSIS
#   OmodInfoXML(parameters)
#
# ARGS
#   parameters      OmodInfoXML - {http://web.cbr.ru/}OmodInfoXML
#
# RETURNS
#   parameters      OmodInfoXMLResponse - {http://web.cbr.ru/}OmodInfoXMLResponse
#
parameters = nil
puts obj.omodInfoXML(parameters)

# SYNOPSIS
#   XVol(parameters)
#
# ARGS
#   parameters      XVol - {http://web.cbr.ru/}XVol
#
# RETURNS
#   parameters      XVolResponse - {http://web.cbr.ru/}XVolResponse
#
parameters = nil
puts obj.xVol(parameters)

# SYNOPSIS
#   XVolXML(parameters)
#
# ARGS
#   parameters      XVolXML - {http://web.cbr.ru/}XVolXML
#
# RETURNS
#   parameters      XVolXMLResponse - {http://web.cbr.ru/}XVolXMLResponse
#
parameters = nil
puts obj.xVolXML(parameters)

# SYNOPSIS
#   MainInfoXML(parameters)
#
# ARGS
#   parameters      MainInfoXML - {http://web.cbr.ru/}MainInfoXML
#
# RETURNS
#   parameters      MainInfoXMLResponse - {http://web.cbr.ru/}MainInfoXMLResponse
#
parameters = nil
puts obj.mainInfoXML(parameters)

# SYNOPSIS
#   AllDataInfoXML(parameters)
#
# ARGS
#   parameters      AllDataInfoXML - {http://web.cbr.ru/}AllDataInfoXML
#
# RETURNS
#   parameters      AllDataInfoXMLResponse - {http://web.cbr.ru/}AllDataInfoXMLResponse
#
parameters = nil
puts obj.allDataInfoXML(parameters)

# SYNOPSIS
#   NewsInfo(parameters)
#
# ARGS
#   parameters      NewsInfo - {http://web.cbr.ru/}NewsInfo
#
# RETURNS
#   parameters      NewsInfoResponse - {http://web.cbr.ru/}NewsInfoResponse
#
parameters = nil
puts obj.newsInfo(parameters)

# SYNOPSIS
#   SwapDynamicXML(parameters)
#
# ARGS
#   parameters      SwapDynamicXML - {http://web.cbr.ru/}SwapDynamicXML
#
# RETURNS
#   parameters      SwapDynamicXMLResponse - {http://web.cbr.ru/}SwapDynamicXMLResponse
#
parameters = nil
puts obj.swapDynamicXML(parameters)

# SYNOPSIS
#   SwapDynamic(parameters)
#
# ARGS
#   parameters      SwapDynamic - {http://web.cbr.ru/}SwapDynamic
#
# RETURNS
#   parameters      SwapDynamicResponse - {http://web.cbr.ru/}SwapDynamicResponse
#
parameters = nil
puts obj.swapDynamic(parameters)

# SYNOPSIS
#   DepoDynamicXML(parameters)
#
# ARGS
#   parameters      DepoDynamicXML - {http://web.cbr.ru/}DepoDynamicXML
#
# RETURNS
#   parameters      DepoDynamicXMLResponse - {http://web.cbr.ru/}DepoDynamicXMLResponse
#
parameters = nil
puts obj.depoDynamicXML(parameters)

# SYNOPSIS
#   DepoDynamic(parameters)
#
# ARGS
#   parameters      DepoDynamic - {http://web.cbr.ru/}DepoDynamic
#
# RETURNS
#   parameters      DepoDynamicResponse - {http://web.cbr.ru/}DepoDynamicResponse
#
parameters = nil
puts obj.depoDynamic(parameters)

# SYNOPSIS
#   OstatDynamicXML(parameters)
#
# ARGS
#   parameters      OstatDynamicXML - {http://web.cbr.ru/}OstatDynamicXML
#
# RETURNS
#   parameters      OstatDynamicXMLResponse - {http://web.cbr.ru/}OstatDynamicXMLResponse
#
parameters = nil
puts obj.ostatDynamicXML(parameters)

# SYNOPSIS
#   OstatDynamic(parameters)
#
# ARGS
#   parameters      OstatDynamic - {http://web.cbr.ru/}OstatDynamic
#
# RETURNS
#   parameters      OstatDynamicResponse - {http://web.cbr.ru/}OstatDynamicResponse
#
parameters = nil
puts obj.ostatDynamic(parameters)

# SYNOPSIS
#   DragMetDynamicXML(parameters)
#
# ARGS
#   parameters      DragMetDynamicXML - {http://web.cbr.ru/}DragMetDynamicXML
#
# RETURNS
#   parameters      DragMetDynamicXMLResponse - {http://web.cbr.ru/}DragMetDynamicXMLResponse
#
parameters = nil
puts obj.dragMetDynamicXML(parameters)

# SYNOPSIS
#   DragMetDynamic(parameters)
#
# ARGS
#   parameters      DragMetDynamic - {http://web.cbr.ru/}DragMetDynamic
#
# RETURNS
#   parameters      DragMetDynamicResponse - {http://web.cbr.ru/}DragMetDynamicResponse
#
parameters = nil
puts obj.dragMetDynamic(parameters)

# SYNOPSIS
#   GetLatestDateTime(parameters)
#
# ARGS
#   parameters      GetLatestDateTime - {http://web.cbr.ru/}GetLatestDateTime
#
# RETURNS
#   parameters      GetLatestDateTimeResponse - {http://web.cbr.ru/}GetLatestDateTimeResponse
#
parameters = nil
puts obj.getLatestDateTime(parameters)

# SYNOPSIS
#   GetLatestDate(parameters)
#
# ARGS
#   parameters      GetLatestDate - {http://web.cbr.ru/}GetLatestDate
#
# RETURNS
#   parameters      GetLatestDateResponse - {http://web.cbr.ru/}GetLatestDateResponse
#
parameters = nil
puts obj.getLatestDate(parameters)

# SYNOPSIS
#   GetLatestDateTimeSeld(parameters)
#
# ARGS
#   parameters      GetLatestDateTimeSeld - {http://web.cbr.ru/}GetLatestDateTimeSeld
#
# RETURNS
#   parameters      GetLatestDateTimeSeldResponse - {http://web.cbr.ru/}GetLatestDateTimeSeldResponse
#
parameters = nil
puts obj.getLatestDateTimeSeld(parameters)

# SYNOPSIS
#   GetLatestDateSeld(parameters)
#
# ARGS
#   parameters      GetLatestDateSeld - {http://web.cbr.ru/}GetLatestDateSeld
#
# RETURNS
#   parameters      GetLatestDateSeldResponse - {http://web.cbr.ru/}GetLatestDateSeldResponse
#
parameters = nil
puts obj.getLatestDateSeld(parameters)

# SYNOPSIS
#   EnumValutesXML(parameters)
#
# ARGS
#   parameters      EnumValutesXML - {http://web.cbr.ru/}EnumValutesXML
#
# RETURNS
#   parameters      EnumValutesXMLResponse - {http://web.cbr.ru/}EnumValutesXMLResponse
#
parameters = nil
puts obj.enumValutesXML(parameters)

# SYNOPSIS
#   EnumValutes(parameters)
#
# ARGS
#   parameters      EnumValutes - {http://web.cbr.ru/}EnumValutes
#
# RETURNS
#   parameters      EnumValutesResponse - {http://web.cbr.ru/}EnumValutesResponse
#
parameters = nil
puts obj.enumValutes(parameters)

# SYNOPSIS
#   GetCursDynamicXML(parameters)
#
# ARGS
#   parameters      GetCursDynamicXML - {http://web.cbr.ru/}GetCursDynamicXML
#
# RETURNS
#   parameters      GetCursDynamicXMLResponse - {http://web.cbr.ru/}GetCursDynamicXMLResponse
#
parameters = nil
puts obj.getCursDynamicXML(parameters)

# SYNOPSIS
#   GetCursDynamic(parameters)
#
# ARGS
#   parameters      GetCursDynamic - {http://web.cbr.ru/}GetCursDynamic
#
# RETURNS
#   parameters      GetCursDynamicResponse - {http://web.cbr.ru/}GetCursDynamicResponse
#
parameters = nil
puts obj.getCursDynamic(parameters)

# SYNOPSIS
#   GetCursOnDateXML(parameters)
#
# ARGS
#   parameters      GetCursOnDateXML - {http://web.cbr.ru/}GetCursOnDateXML
#
# RETURNS
#   parameters      GetCursOnDateXMLResponse - {http://web.cbr.ru/}GetCursOnDateXMLResponse
#
parameters = nil
puts obj.getCursOnDateXML(parameters)

# SYNOPSIS
#   GetSeldCursOnDateXML(parameters)
#
# ARGS
#   parameters      GetSeldCursOnDateXML - {http://web.cbr.ru/}GetSeldCursOnDateXML
#
# RETURNS
#   parameters      GetSeldCursOnDateXMLResponse - {http://web.cbr.ru/}GetSeldCursOnDateXMLResponse
#
parameters = nil
puts obj.getSeldCursOnDateXML(parameters)

# SYNOPSIS
#   GetSeldCursOnDate(parameters)
#
# ARGS
#   parameters      GetSeldCursOnDate - {http://web.cbr.ru/}GetSeldCursOnDate
#
# RETURNS
#   parameters      GetSeldCursOnDateResponse - {http://web.cbr.ru/}GetSeldCursOnDateResponse
#
parameters = nil
puts obj.getSeldCursOnDate(parameters)

# SYNOPSIS
#   GetCursOnDate(parameters)
#
# ARGS
#   parameters      GetCursOnDate - {http://web.cbr.ru/}GetCursOnDate
#
# RETURNS
#   parameters      GetCursOnDateResponse - {http://web.cbr.ru/}GetCursOnDateResponse
#
parameters = nil
puts obj.getCursOnDate(parameters)


