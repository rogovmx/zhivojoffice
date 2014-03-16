class Loadfrom1cController < ApplicationController



  def har #Загрузка характиристи групп
    unless FileTest::exist?("public/data/properties_group_.csv")
    Mailer.deliver_netf("Нет файла характеристики групп  #{request.host}")
    redirect_to :action => 'out'
  end

      begin

       Btg1.delete_all
File.open('public/data/properties_group_.csv', 'r') do |row|

       ff = 0
     row.readlines.each do |line|
       next unless line
       ff+=1
       tmp = line.strip.chomp.split(';')
       btg = Btg1.new
       btg.reserv = tmp[1]

       
       btg.s1 = (ff == 1) ? tmp[0][5..-1] : btg.s1 = tmp[0][1..-1]
        
       btg.name =  tmp[1].index('_') ? tmp[1][1..-1] : tmp[1]
       tg = Tov3.find_by_reserv(tmp[1])
       btg.tg = tg.id if tg

       3.upto(tmp.size) do |t|
          if  tmp[t] == 'Дополнительно'
           btg.s30 = 'Дополнительно'
           btg.dop_num = t
          else

           btg.send("s#{t}=" ,tmp[t]) if t < 30 and tmp[t] != nil
          end
       end
       btg.save
      end
      end
       Mailer.deliver_netf("характеристики групп загружены #{request.host}")
      #File.delete('public/data/properties_group_.csv')
       har_tov
      rescue
      Mailer.deliver_netf("Проблема загрузки файла характеристики групп  #{request.host}")
      end
#render :text => Btg1.all.size.to_s

  end


  def har_tov #Загрузка характеристик товаров

        unless FileTest::exist?("public/data/properties.csv")
    Mailer.deliver_netf('Нет файла характеристики товаров')
    redirect_to :action => 'out'
  end
#
#      no =0
#      yes = 0
#      ni= 0
#      pusto = 0
#      norm =0

      begin

       Bcat1.delete_all
File.open('public/data/properties.csv', 'r') do |row|

      ff = 0
     row.readlines.each do |line|
        
       next unless line

       @tmp = line.strip.chomp.split(';')
       ff+=1
       next if @tmp.compact.size < 3
       
       @cat1 = (ff == 1) ? Cat1.find_by_k1c(@tmp[0][4..-1].strip) : Cat1.find_by_k1c(@tmp[0][1..-1].strip)
       btg1 = Btg1.find_by_tg(@cat1.tov3_id) if @cat1
     if btg1
       
       bcat = Bcat1.new
       bcat.cat1_id = @cat1.id if @cat1
       bcat.btg1_id = btg1.id if btg1
       bcat.s2 = @tmp[1]
       bcat.s1 = (ff == 1) ? @tmp[0][4..-1] :  bcat.s1 =@tmp[0][1..-1]

       3.upto(@tmp.size) do |t|
        if btg1.s30 == 'Дополнительно'
           bcat.s30 = @tmp[btg1.dop_num]
           #tmp[btg1.dop_num] = 'xxxxxxxxxx'
        end
        
        if (t < 30) and btg1.send("s"+t.to_s) != 'no'
            case @tmp[t]
            when 'Ложь'
              bcat.send("s#{t}=" ,'Нет')
             # no +=1
            when 'Истина'  
              bcat.send("s#{t}=" ,'Да')
              # yes +=1
            when ''
              bcat.send("s#{t}=" ,'no')
             # pusto += 1
            when nil
              bcat.send("s#{t}=" ,'no')
             # ni += 1
            else
              bcat.send("s#{t}=" ,@tmp[t])
             # norm += 1
            end 
           
        end
       end 
       bcat.save
     end

    end
      end
       Mailer.deliver_netf('характеристики товаров загружены')
       #File.delete('public/data/properties.csv')
    rescue
      Mailer.deliver_netf('Проблема загрузки файла характеристики товаров')
    end
render :text => Bcat1.all.size.to_s  #+ ' no:' + no.to_s + ' yes:'+  yes.to_s + ' nil:' +  ni.to_s + ' pusto:' + pusto.to_s + ' norm:' +  norm.to_s

  end

def a11
  render :text => Cat1.find_by_k1c('7774973991').k1c

end


def cont #Загрузка контрагентов


  unless FileTest::exist?("public/data/contactors.csv")
    Mailer.deliver_netf("Нет файла Контрагенты  #{request.host}")
    redirect_to :action => 'out'
  else

  begin

     Kontragent.delete_all
File.open('public/data/contactors.csv', 'r') do |row|
      row.readlines.each do |line|
       next unless line
       tmp = line.strip.chomp.split(';')

       kontr = Kontragent.new
       kontr.k1c = tmp[0]
       kontr.kod_m = tmp[1]
       kontr.manager = tmp[2]
       kontr.mail = tmp[3]
       kontr.inn = tmp[4]
       kontr.price_type = tmp[5]
       kontr.save
       



      end
      end
       Mailer.deliver_netf("Контрагенты загружены  #{request.host}")
        pr = Kontragent.find :first
        pr.k1c = pr.k1c[3..-1]
        pr.save
       File.delete('public/data/contactors.csv')
      rescue
       Mailer.deliver_netf("Проблема файла Контрагенты  #{request.host}")
      end

     render :text=>''
  end
end




def analogs #Загрузка аналогов


  unless FileTest::exist?("public/data/analog.csv")
    Mailer.deliver_netf("Нет файла с аналогами  #{request.host}")
    redirect_to :action => 'out'
  end

  begin
      ff = 0

     Analog.delete_all

     File.open('public/data/analog.csv', 'r') do |row|
      row.readlines.each do |line|
       next unless line
       ff+=1
       tmp_a = ff == 1 ? line[4..-1].strip.chomp.split(';') : line[1..-1].strip.chomp.split(';')

       for cell in tmp_a do
          tmp_cat = Cat1.find( :first , :conditions => { :k1c => cell})
          tmp_a.delete(cell) unless tmp_cat
       end

       for cell in tmp_a do
          tmp_cat = Cat1.find( :first , :conditions => { :k1c => cell})
          if tmp_cat
            tmp_a.each { |x| Analog.create( :cat1_id => tmp_cat.id , :k1c => x) unless x == tmp_cat.k1c or Analog.find( :first , :conditions => {:cat1_id => tmp_cat.id , :k1c => x}) }
          end
       end

      end
     end
    Mailer.deliver_netf("Аналоги загружены")
  rescue
    Mailer.deliver_netf("Проблема файла аналоги  #{request.host}")
  end
render :text=>''
end



def out
    render :text => 'ошибка'
end

def fp #Загрузка бонусов

  unless FileTest::exist?("public/data/bonus.csv")
    Mailer.deliver_netf("Нет файла Бонусы  #{request.host}")
    redirect_to :action => 'out'
  else

  begin

    Bonus1.delete_all
File.open('public/data/bonus.csv', 'r') do |row|
      row.readlines.each do |line|
       tmp = line.strip.chomp.split(';')

       bonus = Bonus1.new
       bonus.k1c = tmp[0]
       bonus.ost = tmp[2]
       bonus.save
      end
      end
       Mailer.deliver_netf("Бонусы загружены  #{request.host}")
        pr = Bonus1.find :first
        pr.k1c = pr.k1c[1..-1]
        pr.save
       File.delete('public/data/bonus.csv')
      rescue
       Mailer.deliver_netf("Проблема файла Бонусы  #{request.host}")
      end

  end


end

def o_pr #Загрузка суперпредложений и распродажи
  Oldprice.all.each do |pr|
    @nprice = Nprice1.find_by_k1c(pr.k1c)
    if @nprice
      @nprice.p1_old = pr.price
      @nprice.save
      @cat = Cat1.find_by_k1c(pr.k1c)
      if @cat
        @sale = Raspr1.find_by_k1c(@cat.k1c)
        @cat.raspr = @sale ? 2 : 1
        @cat.smo = 0
        @cat.save
      end
    end
  end
  school
  #render :text => Time.now.to_s + ' старые цены загружены'
end


def school
  School.all.each do |school|
    @cat = Cat1.find_by_k1c(school.k1c)
    if @cat
      @cat.raspr = 4
      @cat.save
    end

  end
end


def fp2 #Загрузка цен

    unless FileTest::exist?("public/data/price.csv")
    Mailer.deliver_netf(" Нет файла Цены  #{request.host}")
    redirect_to :action => 'out'
  end


      begin

    Nprice1.delete_all
      @ff = 0
File.open('public/data/price.csv', 'r') do |row|

      row.readlines.each do |line|
       next unless line
       tmp = line.strip.chomp.split(';')
       
       @ff+=1


       price = Nprice1.new
       price.k1c = (@ff == 1) ? tmp[0][3..-1].strip : tmp[0][0..-1].strip
       price.pp = tmp[2]
       price.m3 = tmp[3]
       price.m5 = tmp[4]
       price.m7 = tmp[5]
       price.m10 = tmp[6]
       price.z2 = tmp[7]
       price.bonus = tmp[8]
       price.porog = tmp[9]
       price.p1_bn = tmp[11]
       price.pp_bn = tmp[12]
       price.m3_bn = tmp[13]
       price.m5_bn = tmp[14]
       price.m7_bn = tmp[15]
       price.m10_bn = tmp[16]
       price.z2_bn = tmp[17]
       price.stavka_nds = tmp[20] if tmp[20]
       price.save

      end
      end
        Mailer.deliver_netf(" Цены загружены  #{request.host}")
        pr = Nprice1.find :first
        pr.k1c = pr.k1c[1..-1]
        pr.save
       # File.delete('public/data/price.csv')
        
      rescue
       Mailer.deliver_netf("Проблема файла с ценами  #{request.host}")
      end

      ld

end




  def ld #Загрузка товаров (из файла в таблицу Atmp (временную))
    unless FileTest::exist?("public/data/tovar.csv")
      Mailer.deliver_netf("Нет файла с товарами  #{request.host}")
      redirect_to :action => 'out'
    end
    if FileTest::size?("public/data/tovar.csv") < 3000000
      Mailer.deliver_netf("Файл с товарами слишком маленький  #{request.host}" )
      redirect_to :action => 'out'
    end
  Atmp.delete_all

    @ff = 0
begin
File.open('public/data/tovar.csv', 'r') do |row|
      row.readlines.each do |line|

        @ff+=1
        next unless line
        tmp = line.strip.chomp.split(';')
        
        atmp = Atmp.new
        atmp.k1s =          (@ff == 1) ? tmp[0][4..-1].strip : tmp[0][1..-1].strip
        atmp.name =         tmp[1]
        atmp.fullname =     tmp[2]
        atmp.brend =        tmp[3]
        atmp.absent =       tmp[4]
        #atmp.ost = tmp[5]
        #atmp.reserv = tmp[6]
        atmp.price =        tmp[5]
        atmp.kod =          tmp[6]
        atmp.k1c_tov3 =     tmp[7]
        atmp.tov3 =         tmp[8]
        atmp.k1c_tov2 =     tmp[9]
        atmp.tov2 =         tmp[10]
        atmp.k1c_first1 =   tmp[11]
        atmp.first1 =       tmp[12]
        atmp.t_type =       tmp[13]
        atmp.sv_ost =       tmp[14]
        atmp.delivery =     tmp[15]
        atmp.sv_ost_msk =   tmp[16]
        atmp.delivery_msk = tmp[17]
        
        atmp.save
        

      end

     end

#  @atmp = Atmp.find :first
#  @atmp = @atmp[1..-1]
#  @atmp.save

   upb_bd
 #  ld_m
 #Mailer.deliver_loadprod(@atmp.size , @exist , @notexist , @notexist_cat , @notov3, @noprice)

rescue
 Mailer.deliver_netf(" ошибка выполнения товары на сайт  #{request.host}")
end
#File.delete('public/data/tovar.csv')



  end




#  def ld_m
#    unless FileTest::exist?("public/data/file001_m.csv")
#    Mailer.deliver_netf('Нет файла с товарами Москва')
#    redirect_to :action => 'out'
#  end
#
#begin
#File.open('public/data/file001_m.csv', 'r') do |row|
#      row.readlines.each do |line|
#
#        tmp = line.split(';')
#        @cat = Cat1.find_by_k1c(tmp[0][1..-1])
#        if @cat
#          @cat.msk = (tmp[5].to_i > 0 or tmp[13] == 'Заказ') ? 1 : 0
#          if @cat.msk == 0 and @cat.spb == 0
#            @cat.vis = 0
#            @cat.smo = 0
#          end
#          @cat.save
#        end
#
#      end
#
#     end
#rescue
# Mailer.deliver_netf('ошибка выполнения товары на сайт Москва')
#end
# end


  def upb_bd  #Загрузка товаров (из Atmp в таблицу с товарами Cat1)
  create_tree
  @atmp = Atmp.all
  @exist = 0
  @added = []
  @exist_cat = []
  @notexist_cat = []
  @notov3 = []
  @noprice = []
  @notexist = 0
  for at in @atmp do
    @cat = Cat1.find_by_k1c at.k1s.strip
    @price = Nprice1.find_by_k1c at.k1s.strip
    if @price
    if @cat
      @exist += 1
      @exist_cat << at
    else
      @cat = Cat1.new
      @notexist += 1
      @notexist_cat << at
      if FileTest::exist?("public/img/#{at.k1s.strip}.jpg")
      @cat.pic1 = at.k1s.strip
      else
      @cat.pic1 = nil
      end
    end
      @tov3=Tov3.find :first , :conditions=>['reserv=?',at.tov3]
#      if @tov3tmp.size == 1
#      @tov3 = @tov3tmp[0]
#      elsif @tov3tmp.size == 0
#      @tov3 = nil
#      else
#      for t3 in @tov3tmp do
#
#      end
#      end

      if @tov3 

      @cat.tov3_id=@tov3.id
      @cat.tg = @tov3.name
      @cat.spb = ((at.sv_ost ? at.sv_ost : 0) > 0 or at.t_type == 'Заказ'  or at.t_type == 'Прайс') ? 1 : 0
      @cat.msk = ((at.sv_ost_msk ? at.sv_ost_msk : 0) > 0 or at.t_type == 'Заказ' or at.t_type == 'Прайс') ? 1 : 0
      @cat.smo = (at.t_type == 'Распродажа') ? 0 : 1
      @cat.k1c = at.k1s
      @cat.brend=at.brend
      @cat.name=at.name
      @cat.fullname=at.fullname
      @cat.k11 = 0
      @cat.status = at.t_type
      @cat.price=@price.pp
      @cat.tg = (at.tov3[0..1] == '_') ? at.tov3[1,at.tov3.size] : at.tov3
      @cat.kpk = at.kod
      @cat.delivery = at.delivery
      @cat.delivery_msk = at.delivery_msk
      @cat.ost_spb = at.sv_ost
      @cat.ost_msk = at.sv_ost_msk
      @cat.vis = 1
      @cat.raspr = 0
      @cat.save
      else
      @notov3 << at
      end
  else
  @noprice << at
  end
  end
  @notexist_cat.sort!{|a,b| a.tov3 <=> b.tov3}
  o_pr
  empty
 Mailer.deliver_loadprod(@atmp.size , @exist , @notexist , @notexist_cat , @notov3, @noprice)
 ld_sets
  end


  def create_tree # Создание родителя 3 уровня - таблица Tov3

  @tov3_at = Atmp.find_by_sql("select distinct tov3, tov2 from atmp")
  @notexist_tov3 = []
  for tov3_at in @tov3_at do
    @tov3 = Tov3.find :first , :conditions=>['reserv=?',tov3_at.tov3]
    unless @tov3
      @tov2 = Tov2.find :first , :conditions => ['reserv=?',tov3_at.tov2]
      if @tov2
      @new_tov3 = Tov3.new
      @new_tov3.reserv = tov3_at.tov3
      @new_tov3.name = tov3_at.tov3[1, tov3_at.tov3.size]
      @new_tov3.tov2_id = @tov2.id
      @new_tov3.save
      end
    end
  end


end





  def empty # Убираем товары которых не должно быть(Cat1)  и делаем невидимыми пустые подкатегории - таблица Tov3
    # Делаем невидимыми товары, которых нет в файле отчета (таблице Atmp)
    @cat=Cat1.find :all , :conditions=>['vis=?',1]
    for cat in @cat do
      @tmp2=Atmp.find :first , :conditions=>['k1s = ?',cat.k1c]
     unless @tmp2
        cat.vis=0
        cat.save
     end

    end


    #Если в подкатегории нет товаров - делаем невидимой
    @tov3=Tov3.all
    ff = 0
    ff2 = 0
    for tov3 in @tov3 do
      if (tov3.cat1.find_all{|t| t.vis}.size == 0) and (tov3.vis)
        ff+=1
        tov3.vis=0
        tov3.save
      elsif (tov3.cat1.find_all{|t| t.vis}.size > 0) and (!tov3.vis)
        ff2+=1
        tov3.vis=1
        tov3.save
      end

    end
  #render :text=>ff.to_s+' пустых групп;' + ff2.to_s+' непустых групп;'


  end


  def null_ost # Убираем с сайта товары с нулевым остатком

  unless FileTest::exist?("public/data/null_ostatki.csv")
    Mailer.deliver_netf("Нет файла null_ostatki.csv  #{request.host}" )
    redirect_to :action => 'out'
  end



ff = 0
ff2 = 0
kill = []
kill2 = []

  begin # Убираем товары с нулевым остатком для СПб
    File.open('public/data/null_ostatki.csv', 'r') do |row|
      row.readlines.each do |line|
       tmp = line.strip.chomp.split(';')
       cat = Cat1.find :first , :conditions=>['k1c = ? and vis = ? and spb = ?',tmp[0] , 1 , 1]
       if cat and cat.status != 'Прайс' and cat.status != 'Заказ'
         cat.spb = 0
         if cat.spb == 0 and cat.msk == 0
          cat.vis = 0
          cat.smo = 0
         end
         cat.save
         ff+=1
         kill << cat.k1c
       end
      end
    end
       Mailer.deliver_null_ost(" null_ostatki.csv загружены , #{ff.to_s}  товаров убрано с сайта для СПб  #{request.host}" , kill) if ff > 0
       #File.delete('public/data/null_ostatki.csv')
  rescue
       Mailer.deliver_netf("Проблема файла null_ostatki.csv  #{request.host}")
  end


  unless FileTest::exist?("public/data/null_ostatki_m.csv")
    Mailer.deliver_netf("Нет файла null_ostatki_m.csv  #{request.host}")
    redirect_to :action => 'out'
  end


  begin # Убираем товары с нулевым остатком для Москвы
    File.open('public/data/null_ostatki_m.csv', 'r') do |row|
      row.readlines.each do |line|
       tmp = line.strip.chomp.split(';')
       cat = Cat1.find :first , :conditions=>['k1c = ? and vis = ? and msk = ?',tmp[0] , 1 , 1]
       if cat and cat.status != 'Прайс' and cat.status != 'Заказ'
         cat.msk = 0
         if cat.spb == 0 and cat.msk == 0
          cat.vis = 0
          cat.smo = 0
         end
         cat.save
         ff2+=1
         kill2 << cat.k1c
       end
      end
    end
       Mailer.deliver_null_ost(" null_ostatki_m.csv загружены , #{ff2.to_s}  товаров убрано с сайта для Москвы  #{request.host}" , kill2) if ff2 > 0
       #File.delete('public/data/null_ostatki_m.csv')
  rescue
       Mailer.deliver_netf("Проблема файла null_ostatki_m.csv  #{request.host}")
  end
render :text=>''
  end


  def ld_sets # Загрузка наборов

   unless FileTest::exist?("public/data/sets.csv")
    Mailer.deliver_netf('Нет файла sets.csv')
    redirect_to :action => 'out'
  end
      SetItem.delete_all
    begin

File.open('public/data/sets.csv', 'r') do |row|
      row.readlines.each do |line|
       @tmp = line.strip.chomp.split(';')
       @tmp[0] = @tmp[0][3..-1] if @tmp[0].size == 13
       @cat = Cat1.find :first , :conditions=>['k1c like ? and vis = ?',@tmp[0] , 1]
       if @cat
         @cat.raspr = 3
         @cat.save
         3.step((@tmp.size - 2), 2) do |el|
           @cat.set_item << SetItem.new( :k1c => @tmp[el] , :quantity => @tmp[el + 1])
         end
       end
      end
  end
 # render :text => @out.join(' | ')
       Mailer.deliver_netf(" sets.csv - загружен  #{request.host}")
      rescue
       Mailer.deliver_netf("Проблема файла sets.csv  #{request.host}")
      end

  end



def new_regs  #Выгрузка в csv новых регистраций за день
  require 'csv'
  #@date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  @date = Time.now.strftime("%Y-%m-%d")
  @yesterday = (Time.new - 1.day).strftime("%Y-%m-%d 20:00:00")
  @regs = User.find :all , :conditions => ['created_at > ?', @yesterday]
  

  CSV.open('public/data/regs.csv', 'w') do |writer|
    for inn in @regs.map(&:inn) do
    writer << [inn]
    end
  end

  @regs_with_client_id = @regs.find_all { |a| a.client_id }

  CSV.open("public/data/regs/regs2_#{@date.to_s}.csv", 'w') do |writer|
    for client_id in @regs_with_client_i.map(&:client_id) do
    k1c = Client.find(client_id).k1c  
    writer << [k1c]
    end
  end

  render :text => 'Файлы записаны'
end

def load_schools # Загрузка товаров к 1 сентября
  School.all.each do |school|
    @cat1 = Cat1.find_by_k1c(school.k1c)
    if @cat1
      @cat1.raspr = 4
      @cat1.save
    end
  end
end


def clr_mongr
  ff=0
  Tov3.all.each do |tov|
    unless tov.tov2
    tov.destroy
    ff+=1
    end
  end

  render :text => " #{ff.to_s}"
end


end