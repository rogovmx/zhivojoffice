 require 'net/http'
 
class LoginController < ApplicationController
  #skip_before_filter :verify_authenticity_token, :only => [:login]
  
  
  layout 'search'

  




   
  def index
   redirect_to :action=>'login'
  end




def true_ip(user)
  ip = request.remote_ip.to_s
 # if user.role == 'user'
  if (ip != '217.119.26.170' and ip != '195.90.179.104') and ((user.role != 'user' and user.role != 'poduser') or user.role3 == 'stat') and user.id != 2019
         @trueuser = false
       else
       @trueuser = true
          end
  
end




  def login
 


    session[:user_id] = nil
    uri=session[:original_uri]
    if request.post?
      user = User.authenticate(params[:name], params[:password])
    #true_ip(user)

      if user 
        session[:user_id] = user.id

        get_price_type(user) #тип цены для пользователя
          
          
        case user.city
        when 'Санкт-Петербург'
          session[:city]='spb'
        when  'Москва'
          session[:city]='msk'
        when'Смоленск'
         session[:city]='smo'
        else
          session[:city]='spb'
        end
        cookies[:city] = session[:city]
        
        uri=session[:original_uri]
        @cart=Cart.find :all,:conditions=>['sesion_id=?',request.session_options[:id]]
        for cart in @cart do
          @cat=Cat1.find :first , :conditions=>['k1c=? and vis=?',cart.k1s,1]
          cart.destroy unless @cat
        end

       if @cart and user.role !='poduser'
         cart_spec
         @cart.each do |cart1|
         cart1.User_id = user.id
         cart1.save
         end
        end
        user.ip = request.remote_ip.to_s
        user.save
        flash[:notice] = "Вы успешно авторизовались. "
        cookies[:zolog] = { :value => "#{user.id*883}", :expires => 12.month.from_now.utc}  if  params[:save] ==  'on'
        
        redirect_to(uri || {:controller=>'kt1'})
#
#      elsif  user and !@trueuser
#        flash[:notice] = 'Административные аккаунты доступны только с рабочего компьютера'
#        redirect_to '/'
      else

          flash[:notice] = "Не совсем удачые логин или пароль."
          redirect_to :controller=>'login', :action=>'login'
      end
    end
  
  end


  
  def cart_spec
  @cart=Cart.find :all,:conditions=>['sesion_id=?',request.session_options[:id]]
  @user=User.find_by_id(session[:user_id])
   @cart.each do |cart|
     cart.User_id=@user.id
     cart.save
     @spec=TovSpec.find(:first,:conditions=>['legal_id=? and k1c=?',@user.client_id,cart.k1s])
     if @spec
       @cart_new=Cart.find(:first,:conditions=>['sesion_id=? and k1s=?',request.session_options[:id],cart.k1s])
       @cart_new.price=@spec.price_spec
       @cart_new.save
     end
   end
  end

  def login_no_js
    session[:user_id] = nil
    if request.post?
  
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to :back
#redirect_to(:controller=>'kt1')
      else
        flash[:notice] = "Не совсем удачые логин или пароль, попробуйте еще )))))))))))"
      end
      else
        
    end
  end


  #def login_add_user(name,password)
    #session[:user_id] = nil
   

      #user = User.authenticate(name,password)
     # if user
       # session[:user_id] = user.id
       # redirect_to(:controller=>'kt1')
       


     # else
      #  flash[:notice] = "Несовсем удачые логин или пароль, попробуй еще )))))))))))"
      #end
  
  #end

  
  def add_user
    session[:or_uri]=request.request_uri
    @user = User.new(params[:user])
    name=@user.name
    password=@user.password
    dop=''
#    if session[:ref]
#    @user.ref = session[:ref].to_i
#    @ref=User.find_by_id(session[:ref].to_i)
#    @client=Client.find_by_id(@ref.client.id) if @ref.client.id
#    dop="Клиент который предложил зарегистрироваться (+200бонусов). <br /> Компания: " + @ref.company_ind + " ИНН:" + @ref.inn + " Имя:" + "#{@client.name}, Код 1С: #{@client.k1c}; ФИО:" + @ref.scr_name + " " + @ref.patronymic + " " + @ref.surname
#    end
    if request.post?
      @user.mail = @user.name
      if @user.save
      flash.now[:notice] = " #{@user.name}, Вы зарегистрировались."

      rnd=rand(999999999999999999999999999999999999999999)
      conf=Confirm.new
      conf.user_id=@user.id
      conf.rnd=rnd
      conf.save
      Mailer.deliver_welcome(@user , @user.password , rnd)
      Mailer.deliver_new1(@user , @user.password , dop)
      #Mailer.deliver_rout1(@user) if (params[:user][:rout_name] != '' and params[:user][:rout_name] != ' ') or (params[:user][:rout_link ]!= '' and params[:user][:rout_link] != ' ')

      #Mailer.deliver_welcome(@user.mail,rnd)
      login_add_user(name,password)
      end
    end
   # render :layout=>'search'
  end



  
#  def add_old_user
#    @user=User.find :first, :conditions=>["old_id=?",params[:id]]
#    @user.update_attributes(params[:user])
#    #@user = User.new(params[:user])
#    name=@user.name
#    password=@user.password
#
#
#    if request.post? and @user.save
#      flash.now[:notice] = "User #{@user.name} created"
#      #@user = User.new
#     # (mail,name,name_l,password,surname,phone,rnd)
#      #redirect_to :controller=>'clients',:action=>'new'
#      #redirect_to :action=>'login_add_user',:name=>name,:password=>password
#      #login_add_user :params=>{:name=>name,:password=>password}
#      rnd=rand(999999999999999999999999999999999999999999)
#      conf=Confirm.new
#      conf.user_id=@user.id
#      conf.rnd=rnd
#      conf.save
#      Mailer.deliver_welcome(@user.mail,@user.scr_name,@user.name,@user.password,@user.surname,@user.phone,rnd)
#      Mailer.deliver_new1(@user.mail,@user.scr_name,@user.name,@user.password,@user.surname,@user.phone,@user.company_ind,@user.inn)
#
#      #Mailer.deliver_welcome(@user.mail,rnd)
#      login_add_user(name,password)
#    end
#  end

  
  #######
#   def add_m_user
#    @user=User.find :first, :conditions=>["id=?",params[:id]]
#    @user.update_attributes(params[:user])
#    #@user = User.new(params[:user])
#    name=@user.name
#    password=@user.password
#
#
#    if request.post? and @user.save
#      flash.now[:notice] = "User #{@user.name} created"
#      #@user = User.new
#     # (mail,name,name_l,password,surname,phone,rnd)
#      #redirect_to :controller=>'clients',:action=>'new'
#      #redirect_to :action=>'login_add_user',:name=>name,:password=>password
#      #login_add_user :params=>{:name=>name,:password=>password}
#      rnd=rand(999999999999999999999999999999999999999999)
#      conf=Confirm.new
#      conf.user_id=@user.id
#      conf.rnd=rnd
#      conf.save
#      Mailer.deliver_welcome(@user.mail,@user.scr_name,@user.name,@user.password,@user.surname,@user.phone,rnd)
#      Mailer.deliver_new1(@user.mail,@user.scr_name,@user.name,@user.password,@user.surname,@user.phone,@user.company_ind,@user.inn)
#
#      #Mailer.deliver_welcome(@user.mail,rnd)
#      login_add_user(name,password)
#    end
#  end



#
#  def delete_user
#    if request.post?
#      user = User.find(params[:id])
#      begin
#        user.destroy
#        flash[:notice] = "User #{user.name} deleted"
#      rescue Exception => e
#        flash[:notice] = e.message
#      end
#    end
#    redirect_to(:action => :list_users)
#  end


#  def list_users
#    @all_users = User.find(:all)
#  end

#  def show
#    @show_users = User.find(:all)
#  end


  def logout
    uri=session[:original_uri]
    #session[:original_uri]=nil
    session[:user_id] = nil
    reset_session
    flash[:notice] = "Вы вышли"
    cookies.delete(:zolog)
    redirect_to '/'
    #redirect_to(uri || {:controller=>'kt1'})
  end


  private

#  def true_ip(user)
#            if ((user.role != 'user' && user.role != 'poduser') || user.role3 == 'stat') #&& user.id != 2019
#          ip = request.remote_ip.to_s
#          if ip != '217.119.26.171' and ip != '195.90.179.104'
#            flash[:notice] = 'Административные аккаунты доступны только с рабочего компьютера'
#            redirect_to '/'
#          end
#        end
#
#  end




  def login_add_user(name,password)
    session[:user_id] = nil
   # if request.get? and session[:or_uri]=='/login/add_user'
      #and request.request_uri=='/login/add_user'

      user = User.authenticate(name,password)
      if user
        session[:user_id] = user.id
        session[:city]='spb' if user.city=='Санкт-Петербург' or user.city==nil
        session[:city]='msk' if user.city=='Москва'
        session[:city]='smo' if user.city=='Смоленск'
        cookies[:city] = session[:city]
        @cart=Cart.find :all,:conditions=>['sesion_id=?',request.session_options[:id]]
         if @cart and user.role !='poduser'
         @cart.each do |cart|
         cart.User_id = user.id
         cart.save
         end
        end
        

      uri=session[:original_uri]
       flash[:notice] = "Вы вошли на сайт."
       redirect_to(uri || {:controller=>'kt1',:action=>'index'})
      else
        flash[:notice] = "Не совсем удачные логин или пароль."
      end
   #end
  end

end
