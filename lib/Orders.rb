require 'xsd/qname'

# {http://192.168.0.15}Accounts
#   m_ - SOAP::SOAPString
#   m_ - Contactors
#   m_ - RekvizitsSet
#   m_ - SOAP::SOAPBoolean
class Accounts
  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def initialize(v_ = nil, v_ = nil, v_ = [], v_ = nil)
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
  end
end

# {http://192.168.0.15}BuyersOrder
#   contractor - Contactors
#   number - SOAP::SOAPString
#   date - SOAP::SOAPDateTime
#   deliveryPoint - SOAP::SOAPString
#   deliveryDate - SOAP::SOAPDate
#   isDelivered - SOAP::SOAPBoolean
#   goods - TableRecord
#   service - TableService
#   bonus - TableBonus
#   manager - SOAP::SOAPString
#   warehouse - SOAP::SOAPString
#   responsible - SOAP::SOAPString
#   organization - SOAP::SOAPString
#   agreement - SOAP::SOAPString
#   comments - Mistakes
#   fromSite - SOAP::SOAPBoolean
class BuyersOrder
  attr_accessor :contractor
  attr_accessor :number
  attr_accessor :date
  attr_accessor :deliveryPoint
  attr_accessor :deliveryDate
  attr_accessor :isDelivered
  attr_accessor :goods
  attr_accessor :service
  attr_accessor :bonus
  attr_accessor :manager
  attr_accessor :warehouse
  attr_accessor :responsible
  attr_accessor :organization
  attr_accessor :agreement
  attr_accessor :comments
  attr_accessor :fromSite

  def initialize(contractor = nil, number = nil, date = nil, deliveryPoint = nil, deliveryDate = nil, isDelivered = nil, goods = [], service = [], bonus = [], manager = nil, warehouse = nil, responsible = nil, organization = nil, agreement = nil, comments = [], fromSite = nil)
    @contractor = contractor
    @number = number
    @date = date
    @deliveryPoint = deliveryPoint
    @deliveryDate = deliveryDate
    @isDelivered = isDelivered
    @goods = goods
    @service = service
    @bonus = bonus
    @manager = manager
    @warehouse = warehouse
    @responsible = responsible
    @organization = organization
    @agreement = agreement
    @comments = comments
    @fromSite = fromSite
  end
end

# {http://192.168.0.15}Contactors
#   m_ - SOAP::SOAPString
#   m_ - SOAP::SOAPString
#   m_ - SOAP::SOAPString
#   m_ - SOAP::SOAPString
#   m_ - SOAP::SOAPString
#   m_ - RekvizitsSet
#   m_ - Managers
class Contactors
  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def initialize(v_ = nil, v_ = nil, v_ = nil, v_ = nil, v_ = nil, v_ = [], v_ = [])
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
  end
end

# {http://192.168.0.15}Contacts
#   m_ - SOAP::SOAPString
#   m_ - Contactors
#   m_ - RekvizitsSet
#   m_ - SOAP::SOAPBoolean
class Contacts
  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def initialize(v_ = nil, v_ = nil, v_ = [], v_ = nil)
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
  end
end

# {http://192.168.0.15}DeliveryPoints
#   m_ - SOAP::SOAPString
#   m_ - Contactors
#   m_ - RekvizitsSet
#   m_ - SOAP::SOAPBoolean
#   m_ - TimeTable
#   m_ - Contacts
class DeliveryPoints
  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def initialize(v_ = nil, v_ = nil, v_ = [], v_ = nil, v_ = [], v_ = [])
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
  end
end

# {http://192.168.0.15}Dogovors
#   m_ - SOAP::SOAPString
#   m_ - Contactors
#   m_ - RekvizitsSet
#   m_ - SOAP::SOAPBoolean
#   m_ - SOAP::SOAPString
class Dogovors
  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def initialize(v_ = nil, v_ = nil, v_ = [], v_ = nil, v_ = nil)
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
  end
end

# {http://192.168.0.15}ListOfContactors
class ListOfContactors < ::Array
end

# {http://192.168.0.15}ListOfDocuments
#   zakaz - BuyersOrder
#   vid - SOAP::SOAPString
class ListOfDocuments
  attr_accessor :zakaz
  attr_accessor :vid

  def initialize(zakaz = [], vid = [])
    @zakaz = zakaz
    @vid = vid
  end
end

# {http://192.168.0.15}Managers
#   m_ - SOAP::SOAPDateTime
#   m_ - RekvizitsSet
class Managers
  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def initialize(v_ = nil, v_ = nil)
    @v_ = v_
    @v_ = v_
  end
end

# {http://192.168.0.15}Mistakes
#   comment - SOAP::SOAPString
class Mistakes
  attr_accessor :comment

  def initialize(comment = nil)
    @comment = comment
  end
end

# {http://192.168.0.15}Ost
class Ost < ::Array
end

# {http://192.168.0.15}OstSet
#   goods - SOAP::SOAPString
#   warehouse - SOAP::SOAPString
#   remains - SOAP::SOAPInteger
#   ostatok - SOAP::SOAPInteger
class OstSet
  attr_accessor :goods
  attr_accessor :warehouse
  attr_accessor :remains
  attr_accessor :ostatok

  def initialize(goods = nil, warehouse = nil, remains = nil, ostatok = nil)
    @goods = goods
    @warehouse = warehouse
    @remains = remains
    @ostatok = ostatok
  end
end

# {http://192.168.0.15}RekvizitsSet
#   m_ - SOAP::SOAPString
#   m_ - SOAP::SOAPString
#   m_ - SOAP::SOAPString
#   m_ - SOAP::SOAPString
class RekvizitsSet
  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def initialize(v_ = nil, v_ = nil, v_ = nil, v_ = nil)
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
  end
end

# {http://192.168.0.15}TableBonus
#   rowNamber - SOAP::SOAPFloat
#   goods - SOAP::SOAPString
#   countSites - SOAP::SOAPInt
#   measureUnit - SOAP::SOAPString
#   measureUnitSites - SOAP::SOAPString
#   multipller - SOAP::SOAPInt
#   quantity - SOAP::SOAPInteger
#   price - SOAP::SOAPFloat
#   characteristics - SOAP::SOAPString
#   seriesNomenclature - SOAP::SOAPString
#   reserveDocument - SOAP::SOAPString
#   orderCustomer - SOAP::SOAPString
#   sum - SOAP::SOAPFloat
class TableBonus
  attr_accessor :rowNamber
  attr_accessor :goods
  attr_accessor :countSites
  attr_accessor :measureUnit
  attr_accessor :measureUnitSites
  attr_accessor :multipller
  attr_accessor :quantity
  attr_accessor :price
  attr_accessor :characteristics
  attr_accessor :seriesNomenclature
  attr_accessor :reserveDocument
  attr_accessor :orderCustomer
  attr_accessor :sum

  def initialize(rowNamber = nil, goods = nil, countSites = nil, measureUnit = nil, measureUnitSites = nil, multipller = nil, quantity = nil, price = nil, characteristics = nil, seriesNomenclature = nil, reserveDocument = nil, orderCustomer = nil, sum = nil)
    @rowNamber = rowNamber
    @goods = goods
    @countSites = countSites
    @measureUnit = measureUnit
    @measureUnitSites = measureUnitSites
    @multipller = multipller
    @quantity = quantity
    @price = price
    @characteristics = characteristics
    @seriesNomenclature = seriesNomenclature
    @reserveDocument = reserveDocument
    @orderCustomer = orderCustomer
    @sum = sum
  end
end

# {http://192.168.0.15}TableRecord
#   rowNamber - SOAP::SOAPFloat
#   goods - SOAP::SOAPString
#   price - SOAP::SOAPFloat
#   vAT - SOAP::SOAPInt
#   quantity - SOAP::SOAPInteger
#   vATAmount - SOAP::SOAPFloat
#   sum - SOAP::SOAPFloat
#   measureUnit - SOAP::SOAPString
#   measureUnitSites - SOAP::SOAPString
#   countSites - SOAP::SOAPInt
#   seriesNomenclature - SOAP::SOAPString
#   characteristics - SOAP::SOAPString
#   multipller - SOAP::SOAPInt
#   goodsType - SOAP::SOAPString
#   discont - SOAP::SOAPFloat
#   forShipment - SOAP::SOAPString
#   addExpenses - SOAP::SOAPFloat
#   shipped - SOAP::SOAPInteger
#   remains - SOAP::SOAPInteger
#   returned - SOAP::SOAPInteger
#   inPlacing - SOAP::SOAPInteger
#   ref - SOAP::SOAPString
#   dateDelivery - SOAP::SOAPDateTime
class TableRecord
  attr_accessor :rowNamber
  attr_accessor :goods
  attr_accessor :price
  attr_accessor :vAT
  attr_accessor :quantity
  attr_accessor :vATAmount
  attr_accessor :sum
  attr_accessor :measureUnit
  attr_accessor :measureUnitSites
  attr_accessor :countSites
  attr_accessor :seriesNomenclature
  attr_accessor :characteristics
  attr_accessor :multipller
  attr_accessor :goodsType
  attr_accessor :discont
  attr_accessor :forShipment
  attr_accessor :addExpenses
  attr_accessor :shipped
  attr_accessor :remains
  attr_accessor :returned
  attr_accessor :inPlacing
  attr_accessor :ref
  attr_accessor :dateDelivery

  def initialize(rowNamber = nil, goods = nil, price = nil, vAT = nil, quantity = nil, vATAmount = nil, sum = nil, measureUnit = nil, measureUnitSites = nil, countSites = nil, seriesNomenclature = nil, characteristics = nil, multipller = nil, goodsType = nil, discont = nil, forShipment = nil, addExpenses = nil, shipped = nil, remains = nil, returned = nil, inPlacing = nil, ref = nil, dateDelivery = nil)
    @rowNamber = rowNamber
    @goods = goods
    @price = price
    @vAT = vAT
    @quantity = quantity
    @vATAmount = vATAmount
    @sum = sum
    @measureUnit = measureUnit
    @measureUnitSites = measureUnitSites
    @countSites = countSites
    @seriesNomenclature = seriesNomenclature
    @characteristics = characteristics
    @multipller = multipller
    @goodsType = goodsType
    @discont = discont
    @forShipment = forShipment
    @addExpenses = addExpenses
    @shipped = shipped
    @remains = remains
    @returned = returned
    @inPlacing = inPlacing
    @ref = ref
    @dateDelivery = dateDelivery
  end
end

# {http://192.168.0.15}TableService
#   rowNamber - SOAP::SOAPFloat
#   description - SOAP::SOAPString
#   quantity - SOAP::SOAPInteger
#   price - SOAP::SOAPFloat
#   sum - SOAP::SOAPFloat
#   vat - SOAP::SOAPInt
#   vATAmount - SOAP::SOAPFloat
#   goods - SOAP::SOAPString
#   discountProcent - SOAP::SOAPFloat
#   avtoDiscountProcent - SOAP::SOAPFloat
#   autoDiscountCondition - SOAP::SOAPInt
#   autoDiscountConditionValue - SOAP::SOAPString
class TableService
  attr_accessor :rowNamber
  attr_accessor :description
  attr_accessor :quantity
  attr_accessor :price
  attr_accessor :sum
  attr_accessor :vat
  attr_accessor :vATAmount
  attr_accessor :goods
  attr_accessor :discountProcent
  attr_accessor :avtoDiscountProcent
  attr_accessor :autoDiscountCondition
  attr_accessor :autoDiscountConditionValue

  def initialize(rowNamber = nil, description = nil, quantity = nil, price = nil, sum = nil, vat = nil, vATAmount = nil, goods = nil, discountProcent = nil, avtoDiscountProcent = nil, autoDiscountCondition = nil, autoDiscountConditionValue = nil)
    @rowNamber = rowNamber
    @description = description
    @quantity = quantity
    @price = price
    @sum = sum
    @vat = vat
    @vATAmount = vATAmount
    @goods = goods
    @discountProcent = discountProcent
    @avtoDiscountProcent = avtoDiscountProcent
    @autoDiscountCondition = autoDiscountCondition
    @autoDiscountConditionValue = autoDiscountConditionValue
  end
end

# {http://192.168.0.15}TimeTable
#   m_ - SOAP::SOAPBoolean
#   m_ - SOAP::SOAPBoolean
#   m_ - SOAP::SOAPDateTime
#   m_ - SOAP::SOAPDateTime
#   m_ - SOAP::SOAPDateTime
#   m_ - SOAP::SOAPDateTime
#   m_ - SOAP::SOAPDateTime
#   m_ - SOAP::SOAPInt
class TimeTable
  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def m_
    @v_
  end

  def m_=(value)
    @v_ = value
  end

  def initialize(v_ = nil, v_ = nil, v_ = nil, v_ = nil, v_ = nil, v_ = nil, v_ = nil, v_ = nil)
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
    @v_ = v_
  end
end

# {http://192.168.0.15}NewOrder
#   order - BuyersOrder
class NewOrder
  attr_accessor :order

  def initialize(order = nil)
    @order = order
  end
end

# {http://192.168.0.15}NewOrderResponse
#   m_return - BuyersOrder
class NewOrderResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}NewCorrect
#   order - BuyersOrder
#   correctNumber - SOAP::SOAPString
#   correctDate - SOAP::SOAPDateTime
class NewCorrect
  attr_accessor :order
  attr_accessor :correctNumber
  attr_accessor :correctDate

  def initialize(order = nil, correctNumber = nil, correctDate = nil)
    @order = order
    @correctNumber = correctNumber
    @correctDate = correctDate
  end
end

# {http://192.168.0.15}NewCorrectResponse
#   m_return - BuyersOrder
class NewCorrectResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}GetContactors
class GetContactors
  def initialize
  end
end

# {http://192.168.0.15}GetContactorsResponse
#   m_return - ListOfContactors
class GetContactorsResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}GetOrder
#   order - BuyersOrder
class GetOrder
  attr_accessor :order

  def initialize(order = nil)
    @order = order
  end
end

# {http://192.168.0.15}GetOrderResponse
#   m_return - BuyersOrder
class GetOrderResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}NewContactors
#   contactor - Contactors
class NewContactors
  attr_accessor :contactor

  def initialize(contactor = nil)
    @contactor = contactor
  end
end

# {http://192.168.0.15}NewContactorsResponse
#   m_return - SOAP::SOAPString
class NewContactorsResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}NewContacts
#   contact - Contacts
class NewContacts
  attr_accessor :contact

  def initialize(contact = nil)
    @contact = contact
  end
end

# {http://192.168.0.15}NewContactsResponse
#   m_return - SOAP::SOAPString
class NewContactsResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}NewAccount
#   account - Accounts
class NewAccount
  attr_accessor :account

  def initialize(account = nil)
    @account = account
  end
end

# {http://192.168.0.15}NewAccountResponse
#   m_return - SOAP::SOAPString
class NewAccountResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}NewDogovor
#   dogovor - Dogovors
class NewDogovor
  attr_accessor :dogovor

  def initialize(dogovor = nil)
    @dogovor = dogovor
  end
end

# {http://192.168.0.15}NewDogovorResponse
#   m_return - SOAP::SOAPString
class NewDogovorResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}NewPoint
#   deliveryPoints - DeliveryPoints
class NewPoint
  attr_accessor :deliveryPoints

  def initialize(deliveryPoints = nil)
    @deliveryPoints = deliveryPoints
  end
end

# {http://192.168.0.15}NewPointResponse
#   m_return - SOAP::SOAPString
class NewPointResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}GetOstatok
#   ost - Ost
class GetOstatok
  attr_accessor :ost

  def initialize(ost = nil)
    @ost = ost
  end
end

# {http://192.168.0.15}GetOstatokResponse
#   m_return - Ost
class GetOstatokResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end

# {http://192.168.0.15}GetDocuments
#   contactorsCode - SOAP::SOAPString
#   quantity - SOAP::SOAPInteger
class GetDocuments
  attr_accessor :contactorsCode
  attr_accessor :quantity

  def initialize(contactorsCode = nil, quantity = nil)
    @contactorsCode = contactorsCode
    @quantity = quantity
  end
end

# {http://192.168.0.15}GetDocumentsResponse
#   m_return - ListOfDocuments
class GetDocumentsResponse
  def m_return
    @v_return
  end

  def m_return=(value)
    @v_return = value
  end

  def initialize(v_return = nil)
    @v_return = v_return
  end
end
