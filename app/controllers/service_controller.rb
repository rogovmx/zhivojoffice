class ServiceController < ApplicationController
  require "parseexcel"
 # require "parsedata.rb"
 # include ParseDate
before_filter:authorize
before_filter :redaktor , :except=>"upload_smo_bonuses"
layout 'search_nofoot'

  def index

   @ipgeo = Service.find(1)
 
  end

  def ipgeo
    @ipgeo = Service.find(1)
    @ipgeo.update_attributes(params[:ipgeo])
    flash[:notice] = "Изменения сохранены"
    redirect_to :action => 'index'

  end

  def togift
    @new_gift = Gift.new
    @new_gift.k1c = params[:id]
    @new_gift.save
      render :update do |page|
       page.replace_html( 'togift', :text=>'Добавлен в подарки' )
     end
  end

  def out_of_gift
    @gift = Gift.find_by_k1c(params[:id])
    @gift.destroy
    render :update do |page|
      page.replace_html( 'togift', :text=>'Удален из подарков' )
    end
  end

  def upload_smo_bonuses

    if request.post?
    file = params[:xls][:xls_file]
    original_filename = file.original_filename

    path = File.join("#{RAILS_ROOT}/public/tmp", original_filename)
    File.open(path, 'wb') { | f | f.write(file.read) }

    exel=Spreadsheet::ParseExcel.parse('public/tmp/' + original_filename)
    worksheet = exel.worksheet(0)
    Bonus1smol.delete_all
    r_num = 0
    worksheet.each { |row|
      r_num += 1
    if r_num > 8
    @ff=0
    @bns = Bonus1smol.new
    row.each do |cell|
       @bns.k1c = cell.to_s('UTF-8').index('.0') ? '0' + cell.to_s('UTF-8')[0..-3] : cell.to_s('UTF-8') if @ff == 1
       @bns.ost = cell.to_i if @ff == 2
       @bns.save
       @ff+=1


    end unless row.nil?
    end
}


 File.delete('public/tmp/' + original_filename)
 @b = Bonus1smol.find(:last)
 @b.destroy
 flash.now[:notice] = "Бонусы загружены"

    end

  end



end
