class Kt1Controller < ApplicationController
   require "will_paginate"
   require 'net/http'
  #require 'rexml/document'
   require 'iconv'

   
   layout 'index' , :only=>'index'
   #layout 'vvk' , :only=>'callme'
   #layout 'l_o1'

   skip_before_filter :verify_authenticity_token, :only => [:chng_pic ,:act_mebel ] 


def unsubscribes
render :layout => 'index'
end


  # заглушки  ------------------------

def tov
    redirect_to :controller=>'kt3',:action=>'tov',:id=>params[:id]
end


%w(kanc1 paper tdo tdov tg2 tg_n).each do |meth|
  define_method(meth) { redirect_to '/' }
end



def kt1_st
  redirect_to :controller => 'kt3' , :action=>'tov' , :id => params[:id]
end


def kt1_spec
  redirect_to :controller => 'kt3' , :action=>'tov' , :id => params[:id]
end

def franchise
     redirect_to '/'
end

# ---------------------------------------

  def locateip
   @ipgeo = Service.find_by_id(1)
 
  if @ipgeo.code == 0
    iplocation='spb'
  else
    ips = request.remote_ip.to_s
    url = "http://ipgeobase.ru:7020/geo?ip="+ips if @ipgeo.code == 1
    url = "http://www.litecode.ru/services/geobase.shtml?ip="+ips if @ipgeo.code == 2
    xml_data=''
#  if request.env["HTTP_X_FORWARDED_FOR"]
#   ip = request.env["HTTP_X_FORWARDED_FOR"]
#  else
#   ip = request.remote_addr
#  end

    xml_data = Net::HTTP.get_response(URI.parse(url)).body if ips != ''

    converter=Iconv.new('UTF-8','Windows-1251')
    city = converter.iconv(xml_data)
    city=xml_data
 
    if city['Моск']!=nil
      iplocation='msk'
    elsif city['Смоленск']!=nil
      iplocation='smo'
    else
      iplocation='spb'
    end
  end

 return iplocation
end





   

#  def initialize
#    @bestseller=Bestseller.find :all
#    @sp=Ist.find:all
#   end






  def index
     #session[:original_uri]=request.request_uri
     #@uri=session[:original_uri]

     #user
     cart

   
   #  unless read_fragment(:fragment=>'kt1index1')
  session[:city] = cookies[:city] if cookies[:city]
  unless session[:city]
     ip=locateip
    
     if ip=='smo' or request.host == '244424.ru'
      session[:city]='smo'
     elsif ip=='msk'  or request.host == '7303077.ru'
      session[:city]='msk'
     else
      session[:city]='spb' #unless session[:city]
     end
   cookies[:city] = session[:city]
   end


   # делал ли пользователь заказы?

#   @client = @user.client if @user
#   if @client
#      @ord=Order.find :first , :conditions=>['user_id=? or legal_id=?',@user.id, @client.id]
#   else
#      @ord=Order.find :first , :conditions=>['user_id=?',@user.id] if @user
#   end
    
# рутинг костыль DO REFACTORING!!!
    if params[:str] 
        @nn = %w{1 2 3 4 5 6 7 8 9 10 11 12 13 14}
        unless @nn.include?(params[:str])
          @id= Razdel1.find_by_link(params[:str]).id
        else
          @id = params[:str].to_i
        end

        @k=First1.find:all,:select=>"name ,kod, id",:conditions=>["kod >? and kod <?",@id*100, (@id+1)*100] ,:order=>'kod'
        @category = @id
      @name=Razdel1.find(@id).name

    end
#авторотация банеров
    @actions = Action.find(1) if session[:city] == 'spb' or session[:city] == nil
    @actions = Action.find(2) if session[:city] == 'msk'

  end







def create_it
  @it=It.new(params[:it])
  @it.save
  render(:partial=> '/kt1/it')
end


def cart
     user
     if @user
      @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     else
      @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
     end
     @cart_count = @cart.size
     @cart_sum = @cart.inject(0) {|r, e| r + e.quantity * e.price   }
 end



 def edit_tov
   user
   if @user.role == 'redaktor'
      @cat1=Cat1.find(params[:id])
      render(:partial =>'/part/edit_tov',:object=>@cat1)
   end
end

def edit_tov_pics
  user
  if @user.role == 'redaktor'
       @cat1=Cat1.find(params[:id])
      render(:partial =>'/part/edit_tov_pics',:object=>@cat1)
  end
end



  def close
    render :text=>''
  end

  def set_city
   session[:city]= params[:city]
   cookies[:city] = params[:city]
   begin
   redirect_to :back
   rescue
   redirect_to '/'
   end

  end



#def menu
#   # user
#   render :update do |page|
#    #page.replace_html( 'm_menu', :partial=>'/part2/m_menu' )
#    page.visual_effect(:blind_down, 'm_menu', :duration=> 0.2)
#    end
#end
#
# def info
#    user
#   render :update do |page|
#    page.replace_html( 'info', :partial=>'/part2/info' )
#    page.visual_effect(:blind_down, 'info', :duration=> 0.2)
# end

#  end

 def chng_pic
     case params[:id]
     when '0'
     @pic='baner.jpg'
     when '1'
     @pic='baner_00_ruchka.jpg'
     when '2'
     @pic='baner_01_kaktus.jpg'
     when '3'
     @pic='baner_02_roza.jpg'
     when '4'
     @pic='baner_21_nozhnizi.jpg'
     when '5'
     @pic='baner_04_dirikol.jpg'
     when '6'
     @pic='baner_06_tetradi.jpg'
     when '7'
     @pic='baner_11_kreslo.jpg'
     when '8'
     @pic='baner_12_textovivoditel.jpg'
     when '9'
     @pic='baner_20_chainik.jpg'
     when '10'
     @pic='baner_13_orhideya.jpg'
     when '11'
     @pic='baner_19_postit.jpg'
     when '12'
     @pic='baner_18_stepler.jpg'
     when '13'
     @pic='baner_16_lastic.jpg'
     when '14'
     @pic='baner_17_ramka.jpg'
     when '15'
     @pic='baner_15_papka.jpg'
     when '16'
     @pic='baner_10_magnit.jpg'
     when '17'
     @pic='baner_07_kruzhka.jpg'
     when '18'
     @pic='baner_05_lampa.jpg'
     when '19'
     @pic='baner_09_marker.jpg'
     when '20'
     @pic='baner_08_kruasan.jpg'
     when '21'
     @pic='baner_14_karandash.jpg'
     end

 render :partial=>'/part2/chng_pic' , :pic=>@pic
end


def catcod
  user
  @ecod = Catcod.find :first , :conditions=>['kod = ?', params[:cod][:entered_cod].to_i]
  if @ecod and !@ecod.used
    @ecod.used = 1
    @ecod.user_id = @user.id if @user
    @ecod.save
    session[:catcod] =  params[:cod][:entered_cod]
    render :update do |page|
     page.replace_html( 'catcod', :partial=>'/part2/choose_card' , :ecod => @ecod  )
     end
  elsif @ecod and @ecod.used
    @mess='код уже использован!'
    render :update do |page|
    page.replace_html( 'ind_cod', :partial=>'/part2/catcod' , :mess=>@mess )
    end
  else
    @mess='код не подходит!'
    render :update do |page|
     page.replace_html( 'ind_cod', :partial=>'/part2/catcod' , :mess=>@mess )
    end

  end

end

def choosecard
  if params[:cod][:card] == '2'
   card = "Л'Этуаль"
  else
   card = 'Рив Гош' 
  end
  session[:card] = card
  render :text => "<p ><strong> Карта #{card} номиналом 300р. добавлена в корзину.</strong> </p>"
end



def ymlfile

@tov2=Tov2.all
@tov3=Tov3.find :all , :conditions=>['vis=?',1]
@cat=Cat1.find :all , :conditions=>['vis=? and tov3_id !=? and k11!=?',1,0,999]

   File.open('public/yandex.yml', 'w') do |f|
      f.puts '<?xml version="1.0" encoding="utf-8"?>'
      f.puts '<yml_catalog date="' + Time.now.to_date.to_s + '">'
      f.puts '<shop>'
      f.puts ' <name>Живой офис</name>'
      f.puts '<company>Живой офис</company>'
      f.puts '<url>http://www.zhivojoffice.ru/</url>'
      f.puts '  <currencies>'
      f.puts '<currency id="RUR" rate="1" plus="0"/>'
      f.puts ' </currencies>'
      f.puts '<categories>'

      for tov2 in @tov2 do
      tov2.name.gsub!('&','и')
      f.puts '  <category id="' + tov2.id.to_s + '">' + tov2.name + '</category>'
      end

      for tov3 in @tov3 do
      tov3.name.gsub!('&','и')
      f.puts '  <category id="' + '100' + tov3.id.to_s + '"' + ' parentId="' + tov3.tov2_id.to_s  + '">' + tov3.name + '</category>'
      end

      f.puts '</categories>'
      f.puts ' <local_delivery_cost>0</local_delivery_cost>'
      f.puts '<offers>'

      for cat in @cat do
       if cat.pic1 != nil and cat.pic1 !=''
       f.puts ' '
       f.puts '<offer id="' + cat.id.to_s + '" ' + 'available="true">'
       f.puts '<url>http://www.zhivoioffice.ru/kt3/tov/' + cat.id.to_s + '</url>'
       f.puts '<price>' + cat.price.to_s + '</price>'
       f.puts '<currencyId>RUR</currencyId>'
       f.puts ' <categoryId>' + '100' + cat.tov3_id.to_s + '</categoryId>'
       f.puts '<picture>' + 'http://www.zhivoioffice.ru/img/' + cat.pic1.strip + '.jpg' + '</picture>'
       f.puts '<delivery>true</delivery>'
       f.puts '<local_delivery_cost>0</local_delivery_cost>'
       cat.fullname.gsub!('&','и')
       cat.fullname.gsub!('<br/>','')
       f.puts '<name>' + cat.fullname + '</name>'
       f.puts '<vendor>' + cat.brend + '</vendor>' if cat.brend != nil and cat.brend !=''
       f.puts ' </offer>'
       end
      end

      f.puts '</offers>'
      f.puts ' </shop>'
      f.puts '</yml_catalog>'
    end
    render :text=>Time.now.to_s + ' YML ready'
  end


def smfile

@tov3=Tov3.find :all , :conditions=>['vis=?',1]

   File.open('public/sitemap2.xml', 'w') do |f|
      f.puts '<?xml version="1.0" encoding="utf-8"?>'
      f.puts '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
 for tov3 in @tov3 do
 f.puts '<url>'
 f.puts '<loc>http://www.zhivojoffice.ru/kt3/tg_v/' + tov3.id.to_s + '</loc>'
 f.puts '<lastmod>' + Time.now.to_date.to_s + '</lastmod>'
 f.puts '<changefreq>weekly</changefreq>'
 f.puts '<priority>0.5</priority>'
 f.puts '</url>'
 end

      f.puts '</urlset>'
    end
    render :text=>Time.now.to_s + ' XML ready'
  end


def act_paper
    @show = params[:show].to_i
    render :update do |page|
    page.replace_html( 'act_paper', :partial=>'/part2/act_paper1' , :object=>@show )
    #page.visual_effect(:highlight, 'act_paper', :duration=> 0.2)
    end
end


def act_mebel
    if params[:show] == 'auto' 
      if session[:show_mebel] == 1
       @show = 2
      else
       @show = 1
      end
    else
    @show = params[:show].to_i
    end

    session[:show_mebel] = @show
    render :update do |page|
    page.replace_html( 'act_mebel', :partial=>'/part2/act_mebel' , :object=>@show )
    #page.visual_effect(:highlight, 'act_mebel', :duration=> 0.2)
    end
end


def actions_index
    if session[:city] == 'spb'
    @actions = Action.find(1)
    elsif session[:city] == 'msk'
    @actions = Action.find(2)
    end
    items = @actions.actionitem.sort{|a , b| a.sort <=> b.sort}
    if params[:show] == 'auto' or session[:show_act_index] == nil
       if session[:show_act_index] < items.size
          session[:show_act_index] += 1
          @show = session[:show_act_index]
      else
          @show = 1
      end
    else
    @show = params[:show].to_i
    end

    session[:show_act_index] = @show
    
    render :update do |page|
      #page.visual_effect(:fade, 'actions_index_spb')
      page['actions_index'].setStyle("display: none;")
      page.replace_html( 'actions_index', :partial=>'/part2/actions_index' , :object=>@show )
      page.visual_effect(:appear, 'actions_index')
    end
end

def actions_index_msk
    if params[:show] == 'auto' or session[:show_act_index] == nil
       if session[:show_act_index] < 4
          session[:show_act_index] += 1
          @show = session[:show_act_index]
      else
          @show = 1
      end
    else
    @show = params[:show].to_i
    end

    session[:show_act_index] = @show
    render :update do |page|
      page['actions_index_msk'].setStyle("display: none;")
      page.replace_html( 'actions_index_msk', :partial=>'/part2/actions_index_msk' , :object=>@show )
      page.visual_effect(:appear, 'actions_index_msk')
    end
end





def act_always
    @show = params[:show].to_i
    
    render :update do |page|
      page['act_always'].setStyle("display: none;")
      page.replace_html( 'act_always', :partial=>'/part2/act_always' , :object=>@show )
      page.visual_effect(:appear, 'act_always')
    end

end

def callme
 
    
if request.post?
    zz1=Zz1.new(params[:zz1])
    zz1.save
    Mailer.deliver_zz(zz1.phone,zz1.name,zz1.quest , zz1.company)
    flash[:notice] = 'Наш оператор свяжется с Вами.'
    @msg = '<h2 style="color: green"> Наш оператор свяжется с Вами. </h2>'
    #render :text=>'<h2 style="color: green"> Наш оператор свяжется с Вами. </h2>'

end
render :layout =>'vvk'
end


end
