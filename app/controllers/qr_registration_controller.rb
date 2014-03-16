class QrRegistrationController < ApplicationController

    layout 'search_nofoot'

  def index
redirect_to '/'
  end

  def reg
    redirect_to '/'

    
     # session[:or_uri]=request.request_uri
    @user = User2.new(params[:user])
    name=@user.name
    password=@user.password

    if request.post? and @user.save
      flash.now[:notice] = "Пользователь #{@user.name} зарегистрирован"
      rnd=rand(999999999999999999999999999999999999999999)
      conf=Confirm.new
      conf.user_id=@user.id
      conf.rnd=rnd
      conf.save
      dop = "Регистрация через QR-ссылку. Необходимо зачислить 250 бонусов."
      Mailer.deliver_welcome(@user.mail,@user.scr_name,@user.name,@user.password,@user.surname,@user.phone,rnd)
      Mailer.deliver_new1(@user.mail,@user.scr_name,@user.name,@user.password,@user.surname,@user.phone,@user.company_ind,@user.inn, @user.city , dop)
      login_add_user(name,password)
    end
  end

    private
  def login_add_user(name,password)
    session[:user_id] = nil
   # if request.get? and session[:or_uri]=='/login/add_user'
      #and request.request_uri=='/login/add_user'

      user = User2.authenticate(name,password)
      if user
        session[:user_id] = user.id
        session[:city]='spb' if user.city=='Санкт-Петербург' or user.city==nil
        session[:city]='msk' if user.city=='Москва'
        session[:city]='smo' if user.city=='Смоленск'
        @cart=Cart.find :all,:conditions=>['sesion_id=?',request.session_options[:id]]
         if @cart and user.role !='poduser'
         @cart.each do |cart|
         cart.User_id = user.id
         cart.save
         end
        end

      flash[:notice] = "Вы вошли на сайт"
      redirect_to :controller=>'kt1',:action=>'index'
      else
        flash[:notice] = "Не совсем удачые логин или пароль."
      end
   #end
  end


end
