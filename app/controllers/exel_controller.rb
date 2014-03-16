class ExelController < ApplicationController
  
   require 'iconv'
   require 'csv'
  #require 'CSV'
   before_filter :authorize
   before_filter :redaktor
  def csv
   
    content_type=  'aplication/vnd.ms-exel'
  # content_type= 'text/csv'
    CSV::Writer.generate(output= "",fs=';')do |csv|
      Tov3.find(:all).each do |tov3|
        converter=Iconv.new('Windows-1251','UTF-8')

        @tov2=Tov2.find(:first,:conditions=>["id=?",tov3.tov2_id])
          if @tov2
            tov2=@tov2.name
             csv << [tov3.id,converter.iconv(tov2),converter.iconv(tov3.name)]
          else
             tov2='n'
             tov3.destroy
          end

     
       
       #csv << [tov3.id,converter.iconv(tov3.name)]
      end
     send_data(output,:type=>content_type,:filename=>'grupp.csv')
    end
    
   
  end

 def csv1
   
    content_type='aplication/vnd.ms-exel'
  # content_type= 'text/csv'
    CSV::Writer.generate(output= "",fs=';')do |csv|
      #Tov3.find(:all).each do |tov3|
      converter=Iconv.new('Windows-1251','UTF-8')
      csv << [converter.iconv('3 гр'), converter.iconv('код1с'),converter.iconv('товарная группа'),converter.iconv('порядок в тов группе'),converter.iconv('первый в гр'),converter.iconv('название')]
      @catt1=Cat1.find :all ,:conditions=>["tov3_id=?",params[:td]]
     @catt1.each do |tov|
       # converter=Iconv.new('Windows-1251','UTF-8')
          t=tov.tov3_id
           tt=t
             csv << [tt,converter.iconv(tov.k1c),converter.iconv(tov.tg),tov.portg,tov.tg1,converter.iconv(tov.name)]
        

     
       
       #csv << [tov3.id,converter.iconv(tov3.name)]
      end
     send_data(output,:type=>content_type,:filename=>'grupp1.csv')
    end
    
   
  end

  def csv1_old

    content_type='aplication/vnd.ms-exel'
  # content_type= 'text/csv'
    CSV::Writer.generate(output= "",fs=';')do |csv|
      #Tov3.find(:all).each do |tov3|
      converter=Iconv.new('Windows-1251','UTF-8')
      csv << [converter.iconv('3 гр'), converter.iconv('код1с'),converter.iconv('код п.к.'),converter.iconv('код комуса'),converter.iconv('код конторинга'),converter.iconv('код прагматика'),converter.iconv('артикул'),converter.iconv('товарная группа'),converter.iconv('порядок в тов группе'),converter.iconv('название'),converter.iconv('описание 1 строка'),converter.iconv('2 строка'),converter.iconv('3строка'),converter.iconv('цвет'),converter.iconv('формат'),converter.iconv('кол-во листов'),converter.iconv('твердость'),converter.iconv('плотность'),converter.iconv('запах'),converter.iconv('модификация'),converter.iconv('вес'),converter.iconv('бренд'),converter.iconv('суббренд'),converter.iconv('рис1'),converter.iconv('рис2'),converter.iconv('описание'),converter.iconv('ед изм'),converter.iconv('цена'),converter.iconv('трансп уп'),converter.iconv('цена за тр уп'),converter.iconv('первый в гр')]
      @catt1=Cat1.find :all ,:conditions=>["tov3_id=?",params[:td]]
     @catt1.each do |tov|
       # converter=Iconv.new('Windows-1251','UTF-8')
          t=tov.tov3_id
           tt=t
             csv << [tt,converter.iconv(tov.k1c),converter.iconv(tov.kpk),converter.iconv(tov.kkom),converter.iconv(tov.kkont),converter.iconv(tov.kprog),converter.iconv(tov.arppr),converter.iconv(tov.tg),tov.portg,converter.iconv(tov.name),converter.iconv(tov.o1s),converter.iconv(tov.o2s),converter.iconv(tov.o3s),converter.iconv(tov.color),converter.iconv(tov.format),converter.iconv(tov.kl),converter.iconv(tov.ktv),converter.iconv(tov.kpl),converter.iconv(tov.kzap),converter.iconv(tov.kmod),converter.iconv(tov.kves),converter.iconv(tov.brend),converter.iconv(tov.subbrend),converter.iconv(tov.pic1),converter.iconv(tov.pic2),converter.iconv(tov.opis),converter.iconv(tov.ei),tov.price,tov.tu,tov.pricetu,tov.tg1]




       #csv << [tov3.id,converter.iconv(tov3.name)]
      end
     send_data(output,:type=>content_type,:filename=>'grupp1.csv')
    end


  end
 

end
