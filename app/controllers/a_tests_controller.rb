#require 'soap/element'
#require 'soap/rpc/driver'
#require 'soap/processor'
#require 'soap/streamHandler'
#require 'soap/property'
#require 'soap/wsdlDriver'
#require 'net/http'
#require 'net/ftp'
require  'rubygems'
gem  'soap4r'


# require 'rexml/document'
require 'iconv'
   #include REXML


class ATestsController < ApplicationController





before_filter :authorize
before_filter :redaktor


def test

#@ord = Order.find( :all , :conditions => [" created_at > ?" , "('2013-06-01')"]).map{ |x| x.user_id}
#
#  @ord_d = @ord.uniq
#  @tmp = []
#  @ord_d.each do |item|
#
# @tmp << item if @ord.find_all { |obj| obj == item }.size > 1
#
#  end
#  render :text => "#{@ord.size}, #{@ord_d.size}, #{@tmp.size} "

@cat = Cat1.visible

end

def test2
    @users = User.find :all , :conditions => {:client_id => 11663}
    @tmp = []
    @users.each{|u| @tmp << Border.find_by_user_id(u.id).user_id if Border.find_by_user_id(u.id)}.compact

  render :text => @tmp.join(', ')
end


def web_s
require 'defaultDriver.rb'

serv = DailyInfoSoap.new

# Формируем запрос
request = GetCursOnDateXML.new(DateTime.now)

# Отправляем запрос на сервер и получаем ответ
response = serv.getCursOnDateXML(request)

# Анализируем ответ и выводим результат
items = response.getCursOnDateXMLResult.valuteData.valuteCursOnDate

#items.each do |item|
#  puts "---------------------------------"
#  puts "Название: " + item['Vname'].strip
#  puts "Числовой код: " + item['Vcode']
#  puts "Символьный код: " + item['VchCode']
#  puts "Номинал: " + item['Vnom']
#  puts "Курс: " + item['Vcurs']
#end
  
render :text =>  items[0]['Vname'].strip + ' ' + items[0]['Vcurs']

end




def allcatwithhars
@btg1s=Btg1.find :all
end

def index
  
end


def sess
  
end

def alltree
  @razdels = Razdel1.all

end



def alltov
  @cat = Cat1.find :all , :conditions=>['vis=? and raspr > ?',1 ,1] , :order =>'tov3_id'
end


def catcod
#  201325641.upto(201350500) do |i|
#  @cc = Catcod.new
#  @cc.kod = i
#  @cc.save
#  end

  for tmp in Temp.all do
    @cc = Catcod.find_by_kod(tmp.kod)
    @cc.destroy if @cc
  end

  render :text=>'kill them all2'
end




def delf
  @list = ['']
  #Dir.foreach("/img") { |entry| @list << entry }
  @dir = Dir.entries("#{RAILS_ROOT}/public/img")
  @dir -= ['.' , '..' , 'big' , 'raspr1']
  @dir.map!{|m| m[0...-4]}
  @img = Cat1.find(:all, :select=>'pic1').map{|m| m.pic1}
  
  for dir in @dir do
    unless @img.include?(dir)
    @list << dir 
    File.delete("#{RAILS_ROOT}/public/img/" + dir + '.jpg')
    end
  end



end




def com
render :partial=>'a_tests/com'
end



  def post_xml
adr = "http://85.21.123.18"
request_xml_string = <<STR
<?xml version="1.0" encoding="utf-8" ?>
<Operation opId="3" opcode="111111">
  <All All="1"/>
</Operation>
STR
stream = SOAP::HTTPStreamHandler.new(SOAP::Property.new)

header = SOAP::SOAPHeader.new
body_item = SOAP::SOAPElement.new('getResponse', request_xml_string)
body = SOAP::SOAPBody.new(body_item)
envelope = SOAP::SOAPEnvelope.new(header, body)
request_string = SOAP::Processor.marshal(envelope)
request = SOAP::StreamHandler::ConnectionData.new(request_string)

resp_data = stream.send(adr, request, 'getResponse')

#puts "Got response:"
@out = resp_data.receive_string
  end


 def ulpd
   if request.post?

  file = params[:cat1img][:pic]
  original_filename = file.original_filename
  path = File.join("#{RAILS_ROOT}/public/tmp", original_filename)
  File.open(path, 'wb') { | f | f.write(file.read) }
#  ftp = Net::FTP.new('62.152.56.2')
#  ftp.passive = true
#  ftp.login(user = "spns", passwd="27spens64")
#  ftp.putbinaryfile(path, File.basename(original_filename))
#  ftp.quit()

    #new_cat1_pic(params[:cat1img], params[:path])

    #redirect_to :back
   end
 end

 def upld


 end


def new_cat1_pic(upload, dir)
     name =  upload[:pic].original_filename if upload[:pic]
    directory = dir
    # create the file path
    path = File.join(directory, name) if upload[:pic]

   if upload[:pic].instance_of?(Tempfile)
   FileUtils.cp(upload[:pic].local_path, path)
   else
    File.open(path, "wb") { |f| f.write(upload[:pic].read) } if upload[:pic]
   end


  end




def k1c_photo

  @cat=Cat1.find :all , :conditions=>["vis=?",1], :select=>'k1c , pic1'
end



def ip2


@location = locateip()
render :text=>@location
end

def locateip
 #ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_addr;
 #ip = request.remote_ip
 ips="89.175.251.18"
 #ips = ip.to_s
 url = "http://ipgeobase.ru:7020/geo?ip="+ips
 xml_data = Net::HTTP.get_response(URI.parse(url)).body
 converter=Iconv.new('UTF-8','Windows-1251')
 city=converter.iconv(xml_data)
 if city['Москва']!=nil
  iplocation='msk'
 elsif city['Смоленск']!=nil
   iplocation='smo'
 elsif city['Санкт-Петербург']!=nil
   iplocation='spb'
 end
 render :text=>city
 #return iplocation

end


  
  
  
def ip
    @ip=request.env["HTTP_X_FORWARDED_FOR"] || request.remote_addr
    render :text=>@ip
end
  
  def price
      
  end

def mm
#@mails=User.find_by_sql(["select distinct mail from users where soglasen=1 and id>1000 and mail like ? and NOT(mail like ?) and NOT(mail like ?) and NOT (city like ?)  order by created_at desc", '%'+'@'+'%' , '%'+' '+'%' , '%'+'-'+'%', 'Смоленск' ])
@mails=User.find_by_sql(["select distinct mail from users where mail like ?  or mail like ?", '%'+'plukicheva'+'%'])


@mails.each do |user|


#mail = Mailer.create_mailer
#mail.set_content_type("multipart/related")
Mailer.deliver_mailer2(user)
sleep(1)
end
render :text=>'<h1 style="color: red" >Рассылка завершена! </h1>'
#redirect_to :back
  end

def mm2
@mail1=User.find_by_sql(["select distinct mail from users where soglasen=1 and NOT(mail like ?) and mail like ? and NOT(mail like ?) and NOT(mail like ?) and NOT (mail like ?) order by created_at desc", '%'+'spens'+'%' , '%'+'@'+'%' , '%'+' '+'%' , '%'+'-'+'%', '%'+','+'%'])
#@mail1=User.find_by_sql(["select distinct mail from users where mail like ? ",  '%'+'mrogov'+'%'])
#@mail1=Rassilka.all
@received=Received.all

@mails=(@mail1.map{|x| x.mail}.compact - @received.map{|x| x.mail}.compact).uniq
ff=0
@mails.each do |user|
ff+=1
Mailer.deliver_mailer(user)
sleep(1)
@rec=Received.new
@rec.mail = user
@rec.number =ff
@rec.save
end
render :text=>'<h1 style="color: red" >Рассылка завершена! </h1>'

  end

def kontr
  @managers=Kontragent.find_by_sql(["select distinct manager from kontragents order by manager"])
end



  def bonus
    @photo=Bfoto1.all

    @photo.each do |photo|
      @bonus=Bonus3.find_by_id(photo.itemid)
      if @bonus
      @bonus.photo = photo.photo
      @bonus.save
      end
    end

  end

  def spets
    @spetc = Sale.all
    tt=0
    for sp in @spetc do
      @tmp = Cat1.find :first , :conditions =>['k1c=?',sp.k1c]
      if @tmp
      tt+=1
        @tmp.raspr = 1
        @tmp.save
      end

    end
    render :text => 'распродажа: ' + tt.to_s
  end




  def raspr
     @rrr=Raspr1.find :all
  end

  def water
    @allw=Worder.find :all
  end

  def userid
    #render :text=>params[:user_id][:userid]
  
    session[:user_id]=params[:user_id][:userid]
    user = User.find(session[:user_id])
    get_price_type(user) #тип цены для пользователя



    redirect_to :controller=>'kt1', :action=>'index'
  end

def order
  order=Order.find(params[:order][:ord])
  card = nil
  unless order.user1_id
  user = User.find(order.user_id)
  Mailer.deliver_zakaz1(order, card,user)
  else
  user = User.find(order.user1_id)
  Mailer.deliver_zakaz2(order, user)
  end
  redirect_to :back
  end



   def bonuses

  session[:report] = 'Обработка бонусов'
  @atmp_bonus=Atmp2.find :all , :conditions=>['tov3=?','_БОНУСЫ']
  for bon in @atmp_bonus do
    @price=Nprice1.find_by_k1c(bon.k1s)
    @cat = Cat1.find( :first , :conditions=>['k1c=?',bon.k1s]) || Cat1.new
      @cat.vis=1
      if bon.absent == 'Ложь'
      @cat.k11='999'
      else
      @cat.k11='0'
      end
      if bon.spb == 'Истина'
      @cat.spb=1
      else
      @cat.spb=0
      end
      if bon.msk == 'Истина'
      @cat.msk=1
      else
      @cat.msk=0
      end
      @cat.name=bon.name
      @cat.fullname=bon.fullname
      @cat.tg='БОНУСЫ'
      @cat.price=@price.bonus
      @cat.save

  end

  end

  def showrep
    render :text => session[:report] || Time.now.to_s
  end


  def loadreports

  end


    def cls3

    bonuses #обновление бонусных товаров


    @atmp2=Atmp2.find :all , :conditions=>['tov3!=?','_БОНУСЫ'] #выбираем из таблицы все кроме бонусов
    @ff=0
    @ff2=0
    @k1=[]
    @k2=[]
    @duble=[]
    @a = 0
    for at in @atmp2 do
      @a+=1
      session[:report] = 'Загрузка номенклатуры ' + @a.to_s + ' из ' + @atmp2.size.to_s
      @tmp=Cat1.find(:first , :conditions=>['k1c=? and tov3_id!=?',at.k1s.strip,0]) || Cat1.new #находим по коду 1с соответствующий товар в таблице Cat1s или создаем новый
      #@tmp2=Cat1.find :all , :conditions=>['k1c=?',at.k1s.strip]
      #@duble<<@tmp2[0] if @tmp2.size > 1
      @price=Nprice1.find_by_k1c(at.k1s) # находим цену
      
      if @price # если цена есть то товар обрабатывается

          @ff+=1
      @tov3=Tov3.find :first , :conditions=>['reserv=?',at.tov3]
      if @tov3
        @ff2+=1
      @k1<<@tmp unless @tmp.id
      else
      @k2<<at #if at.tov3 != '_БОНУСЫ'
      end

      @tmp.vis=1
      @tmp.k1c=at.k1s.strip
      if at.absent == 'Ложь'
      @tmp.k11='999'
      else
      @tmp.k11='0'
      end
      if at.spb == 'Истина'
      @tmp.spb=1
      else
      @tmp.spb=0
      end
      if at.msk == 'Истина'
      @tmp.msk=1
      else
      @tmp.msk=0
      end
      @tmp.brend=at.brend
      @tmp.name=at.name
      @tmp.fullname=at.fullname
      @tmp.tov3_id=@tov3.id
      #@tmp.opis=at.opis
      @tmp.price=@price.pp
      @tmp.tg=at.tov3[1,at.tov3.size]
      @kod = Katalog.find :first ,:conditions=>["k1c=?",@tmp.k1c]
      @tmp.kpk = @kod.kod if @kod
      @tmp.save
      end 
      

    end


    session[:report] = 'Убираем товары которые не нужны'
     @cat=Cat1.find :all , :conditions=>['vis=?',1]
    for cat in @cat do
      @tmp2=Atmp2.find :all , :conditions=>['k1s=?',cat.k1c]
        if @tmp2.size==0
        cat.vis=0
        cat.save
      end

    end

  #raspr2

  #raspr3

 # raspr_invis

 # absent

  #mskpaper

  #price2
  empty
  spets2
  # август акция с бумагами
#@tg=[]
#@tg << Cat1.find(22789) << Cat1.find(22790) << Cat1.find(22791)
# for tg in  @tg do
#   tg.msk = 0
#   tg.spb = 0
#   tg.vis = 0
#   tg.save
# end

 Mailer.deliver_newgoods(@k1)


  end




  def empty
    session[:report] = 'Обработка товарных груп'
    @tov3=Tov3.all
    ff=0
    for tov3 in @tov3 do
      @goods = Cat1.find :first , :conditions=>['tov3_id=? and vis=?',tov3.id,1]
      unless @goods
        ff+=1
        tov3.vis=0
        tov3.save
      else
        tov3.vis=1
        tov3.save
      end

    end
 # render :text=>ff.to_s+' пустых групп;'
  end

def spets2
  session[:report] = 'Спецпредложения'
    @sale = Sale.all

    for sp in @sale do
      @tmp = Cat1.find :first , :conditions =>['k1c=?',sp.k1c]
      if @tmp

        @tmp.raspr = 1
        @tmp.k11 = '0'
        @tmp.save
      end

    end


  for sp2 in Spetzpredl.all  do
    @tmp = Sale.find :first , :conditions=>['k1c=?',sp2.k1c]
    if @tmp

   if sp2.spb_msk
    @tmp.spb = sp2.ost
    @tmp.save
   else
    @tmp.msk = sp2.ost
    @tmp.save
   end

    #tt+=sp2.spb_msk

    end
  end


  #render :text => 'распродажа: '  + tt.to_s
  end

def all_pic
  @cat = Cat1.find :all# , :conditions => ['vis = ?' ,1]


end







   private

   def authorize
     unless User.find_by_id(session[:user_id])
       session[:original_uri]=request.request_uri

     redirect_to(:action=>'index')
     end
   end



end
