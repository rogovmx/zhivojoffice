class An1Controller < ApplicationController

 # require "parsedata.rb"
 # include ParseDate
 before_filter :authorize
 before_filter :redaktor
layout 'search_nofoot'

  def index
    redirect_to :action => 'ind'
  end


 def ind
   @names=['','Января','Февраля','Марта','Апреля','Мая','Июня','Июля','Августа','Сентября','Октября','Ноября','Декабря']
 @today =  Time.now.day.to_s + ' ' + @names[Time.now.month.to_i].to_s + ' ' + Time.now.year.to_s

  end

  def index1
  


    #@count=Lineitem.find_by_sql("SELECT sum(quantity * price)as sum from lineitems where created_at BETWEEN '10.11.01' and '10.12.01'")
   # @count1=Lineitem.find_by_sql("SELECT sum(quantity * price) from lineitems where order_id=1859")

     # @count3=Order.count :conditions=>["created_at between ? and ?",'10.11.01','10.12.01']
     # @count=Lineitem.find_by_sql("SELECT quantity from lineitems where id='1859'")
     # @count=Lineitem.count :conditions=>[ "created_at between ? and ?" , '10.11.01','10.12.01']
      #@count1=Lineitem.sum(:quantity * :price), :conditions=>["created_at between ? and ?" , '10.11.01','10.12.01']
    # @zakaz=Order.find :all, :conditions=>["created_at between ? and ?",'10.11.01','10.12.01']
 d1=params[:nd].split(' ')
 d2=params[:kd].split(' ')
 d11=d1[0]
 d12 = case d1[1]
 when "Января"
   "1"
 when "Февраля"
   "2"
 when "Марта"
   "3"
 when "Апреля"
   "4"
 when "Мая"
   "5"
 when "Июня"
   "6"
 when "Июля"
   "7"
 when "Августа"
   "8"
 when "Сентября"
   "9"
 when "Октября"
   "10"
 when "Ноября"
   "11"
 when "Декабря"
   "12"
 else
   Time.now.month
 end

 d13=d1[2]
 d1_str=d13.to_s + "." + d12.to_s + "." + d11.to_s
d20=d2[0]

  d21 = case d2[1]
  when "Января"
   "1"
 when "Февраля"
   "2"
 when "Марта"
   "3"
 when "Апреля"
   "4"
 when "Мая"
   "5"
 when "Июня"
   "6"
 when "Июля"
   "7"
 when "Августа"
   "8"
 when "Сентября"
   "9"
 when "Октября"
   "10"
 when "Ноября"
   "11"
 when "Декабря"
   "12"
 else
   Time.now.month
 end
 d22=d2[2]
 d2_str=d22.to_s + '.' + d21.to_s + '.' + d20.to_s

 @d1 = d1_str
 @d2 = d2_str

    @d1_1 = d1[1]
    @d2_1 = d2[1]
    @dd = params[:nd].split(' ')

  @test =Order.find :all , :conditions=>["user_id = ? and created_at between ? and ?", 548 , d1_str , d2_str]
  for test in @test do
   for li in test.lineitem do
     li.destroy
   end
   test.destroy
  end

# @count3=Order.count :conditions=>["created_at between ? and ?",params[:nd],params[:kd]]
#@zakaz=Order.find :all, :conditions=>["created_at between ? and ?",params[:nd],params[:kd]]
#@count=Lineitem.find_by_sql("SELECT sum(quantity * price)as sum from lineitems where created_at BETWEEN '"+ params[:nd]+"' and '"+ params[:kd]+"'")
#
#
 @count3=Order.count :conditions=>["user_id !=? and created_at between ? and ?",548 ,d1_str,d2_str]

 @count_all=Order.find :all, :conditions=>["user_id !=? and created_at between ? and ?",548,d1_str,d2_str]

 @count_spb=[]
 @count_msk=[]
 @count_smo=[]
 for ca in  @count_all do
 user=User.find_by_id(ca.user_id)
 
 if user and user.city=='Москва'
   @count_msk <<  ca
 elsif user and  user.city=='Смоленск'
   @count_smo <<  ca
 else
 @count_spb <<  ca
 end
 
 end

 #@count_spb =Order.find :all , :conditions=>["(city=? or city=?)  and (created_at between ? and ?)",nil , 1,d1_str,d2_str]
 #@count_msk =Order.find :all , :conditions=>["city=? and (created_at between ? and ?)",2,d1_str,d2_str]
 #@count_smo =Order.find :all , :conditions=>["city=? and (created_at between ? and ?)",3,d1_str,d2_str]



@zakaz=Order.find :all, :conditions=>["user_id != ? and created_at between ? and ?",548,d1_str,d2_str]
@zakaz_spb=Order.find :all, :conditions=>["user_id != ? and created_at between ? and ?",548,d1_str,d2_str]

@count=Lineitem.find_by_sql("SELECT sum(quantity * price)as sum from lineitems where created_at BETWEEN '"+ d1_str+"' and '"+d2_str +"'")
@rer=User.count :conditions=>["created_at between ? and ?",d1_str,d2_str]
@katalog=ZakazCatalog.count :conditions=>["created_at between ? and ?",d1_str,d2_str]
#@raspr1=Lineitem.find_by_sql("select count(otdel)as count from lineitems where (created_at BETWEEN '"+ d1_str+"' and '"+d2_str +"') and otdel='raspr'")
#@raspr1=Lineitem.count :conditions=>["(created_at between ? and ?) and otdel=? ",d1_str,d2_str,'raspr']
#@raspr=Lineitem.find_by_sql("select sum(quantity * price)as sum from lineitems where (created_at BETWEEN '"+ d1_str+"' and '"+d2_str +"'" + ")and otdel='raspr'")
  respond_to do |format|
      format.html
 end

  end

   def bar
 d1=parsedate(params[:ndb])
 d2=parsedate(params[:kdb])
 d11=d1[0]
 d12= d1[1]
 d13=d1[2]
 d1_str=d11.to_s + "." + d12.to_s + "." + d13.to_s
 d20=d2[0]
 d21= d2[1]
 d22=d2[2]
 d2_str=d20.to_s + '.' + d21.to_s + '.' + d22.to_s

 @zakaz=Order.find :all, :conditions=>["created_at between ? and ?",d1_str,d2_str]



  end

    def bar1
 d1=parsedate(params[:ndb])
 d2=parsedate(params[:kdb])
 d11=d1[0]
 d12= d1[1]
 d13=d1[2]
 d1_str=d11.to_s + "." + d12.to_s + "." + d13.to_s
 d20=d2[0]
 d21= d2[1]
 d22=d2[2]
 d2_str=d20.to_s + '.' + d21.to_s + '.' + d22.to_s

 @zakaz=Order.find :all, :conditions=>["created_at between ? and ?",d1_str,d2_str]



  end

    def tov3

      if params[:id] == '1'
        @items = Lineitem.find :all , :conditions => ['created_at >= ? and created_at < ?', "('2012-01-01')" , "('2012-07-01')"]
      elsif params[:id] == '2'
        @items = Lineitem.find :all , :conditions => ['created_at >= ? and created_at < ?', "('2012-07-01')" , "('2013-01-01')"]
      elsif params[:id] == '3'
        @items = Lineitem.find :all , :conditions => ['created_at >= ? ', "('2013-01-01')" ]
      else
        @items = Lineitem.find :all , :conditions => ['created_at >= ? ', "('2013-09-16')" ]
      end

      @tov3 = Tov3.all

    end



   def tovgr
d1=params[:ndb].split(' ')
 d2=params[:kdb].split(' ')
 d11=d1[0]
 d12 = case d1[1]
 when "Января"
   "1"
 when "Февраля"
   "2"
 when "Марта"
   "3"
 when "Апреля"
   "4"
 when "Мая"
   "5"
 when "Июня"
   "6"
 when "Июля"
   "7"
 when "Августа"
   "8"
 when "Сентября"
   "9"
 when "Октября"
   "10"
 when "Ноября"
   "11"
 when "Декабря"
   "12"
 else
   Time.now.month
 end

 d13=d1[2]
 d1_str=d13.to_s + "." + d12.to_s + "." + d11.to_s
d20=d2[0]

  d21 = case d2[1]
  when "Января"
   "1"
 when "Февраля"
   "2"
 when "Марта"
   "3"
 when "Апреля"
   "4"
 when "Мая"
   "5"
 when "Июня"
   "6"
 when "Июля"
   "7"
 when "Августа"
   "8"
 when "Сентября"
   "9"
 when "Октября"
   "10"
 when "Ноября"
   "11"
 when "Декабря"
   "12"
 else
   Time.now.month
 end
 d22=d2[2]
 d2_str=d22.to_s + '.' + d21.to_s + '.' + d20.to_s

 @zakaz=Order.find :all, :conditions=>["created_at between ? and ?",d1_str,d2_str]
 @tg=First1.find :all
 @count3=Order.count :conditions=>["created_at between ? and ?",d1_str,d2_str]

  end

end
