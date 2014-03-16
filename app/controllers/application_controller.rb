# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time



  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery  :secret => '53f7d51f5d9cc3fa021b9c1c26b37e8c'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password



   def user

    
    session[:user_id] = cookies[:zolog].to_i / 883 if cookies[:zolog]
    session[:city] = cookies[:city] if cookies[:city]
    @user=User.find_by_id(session[:user_id])
    get_price_type(@user) if @user #тип цены для пользователя
    if @user.city == 'Смоленск'
      @bns = Bonus1smol.find_by_k1c(@user.client.k1c) if @user.client
      #session[:bonuses] = bns.ost if bns
    else
      @bns = Bonus1.find_by_k1c(@user.client.k1c) if @user.client
      #session[:bonuses]= bns.ost if bns
    end if @user and session[:bonuses] == nil



  end

 

   def cart
     user
     if @user
     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     else
     @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
     end
     @cart_count = @cart.size || 0

     @cart_sum_bonus = 0
     @cart_bonus = @cart

     @cart_sum_bonus = @cart.sum { |cart1| cart1.price * cart1.quantity} if @cart
     @cart_sum = 0

     @b_tov = @cart.find_all{|s| s.k1s == '7774975534' or s.k1s == '7774975535'}
     @act_bonus = @b_tov.sum{|s| s.quantity if s.k1s == '7774975534' or s.k1s == '7774975535'} if @b_tov


     @cart.each do |cart|

       #Находим дубли, суммируем кол-во товара и удалякм лишнюю строку из корзины
      if @user
        @double=Cart.find :all,:conditions=>['(User_id=? or sesion_id=?) and k1s=? and id!=?', @user.id,request.session_options[:id] , cart.k1s , cart.id]
      else
        @double=Cart.find :all,:conditions=>['sesion_id=? and k1s=? and id!=?', request.session_options[:id] , cart.k1s , cart.id]
      end

      if @double and @double.any?
        cart.quantity = @double.sum{|s| s.quantity}
        cart.save
        @double.each{|x| x.destroy}
      end 
       # ----------------  дубли end

       @cat_vis = Cat1.find :first , :conditions=>['k1c = ? and  vis =?', cart.k1s ,1]
       unless @cat_vis
        cart.destroy
       else
        if cart.quantity == '' or cart.quantity == nil
        cart.quantity = 1
        cart.save
        end


        #Костыль для изумруда
#        if cart.k1s == '7774973992'
#
#          if cart.quantity > 25  and cart.quantity <= 300
#          cart.price = 113
#          cart.save
#          @cart_sum += cart.price * cart.quantity
#          elsif  cart.quantity <= 25
#          cart.price = @outprice
#          cart.save
#          @cart_sum +=cart.price * cart.quantity
#          elsif cart.quantity > 300
#          @m300 =   cart.quantity - 300
#          @cart_sum += 113 * 300 + findprice('7774973992') * @m300
#          end
#
#       else
        @cart_sum += cart.price * cart.quantity if cart.price
#       end

         #-----------


       end
     end

     if @user
     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     else
     @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
     end

     @q_tov = @cart.sum{ |x| x.quantity}



     end
     
 private

  def uri_f
    #session[:original_uri]=request.request_uri
    # @uri=session[:original_uri]
     #@uri=request.request_uri
  end




   def authorize
     unless User.find_by_id(session[:user_id])
       session[:original_uri]=request.request_uri

     redirect_to(:controller=>'login',:action=>'login')
     end
   end

      def authorize?
     unless User.find_by_id(session[:user_id])
        return false
      else
        return true
      end

   end

   def admin_s
      @user=User.find_by_id(session[:user_id])
      unless @user.role=='admin_s'
        redirect_to :controller=>'er_admin'

      end
   end

   def redaktor
      @user=User.find_by_id(session[:user_id])
      unless (@user.role=='redaktor' or @user.role=='sredaktor')
        redirect_to :controller=>'er_admin'
      end
   end


   def redaktor?
      @user=User.find_by_id(session[:user_id])
      unless (@user and (@user.role=='redaktor' or @user.role=='sredaktor'))
        return false
      else
        return true
      end
   end

   def admin_bonus
      @user=User.find_by_id(session[:user_id])
      unless @user.role=='bonus'
        redirect_to :controller=>'er_admin'
      end
   end
    def admin_call
      @user=User.find_by_id(session[:user_id])
      unless @user.role=='callcentr'
        redirect_to :controller=>'er_admin'
      end
   end

    def mess
      @user=User.find_by_id(session[:user_id])
      unless @user.role=='mess'
        redirect_to :controller=>'er_admin'
      end
   end
   def manager
      @user=User.find_by_id(session[:user_id])
      unless @user.role=='manager'
        redirect_to :controller=>'er_admin'
      end
   end


def findprice(k1c) # Ищем цену товара для данного пользователя, session[:p_type] (тип цены) инициализируется при авторизации login/login
 #@user=User.find_by_id(session[:user_id])

  @all_prices=Nprice1.find :first ,:conditions=>["k1c=?",k1c]

  @price_spec=TovSpec.find(:first,:conditions=>{:legal_id => User.find(session[:user_id]).client_id , :k1c => k1c}) if session[:user_id]
  return  @price_spec.price_spec if @price_spec

  return case session[:p_type]
         when 'pp'
                  @all_prices.pp
         when 'm3'
                  @all_prices.m3 || @all_prices.pp
         when 'm5'
                  @all_prices.m5 || @all_prices.pp
         when 'm7'
                  @all_prices.m7 || @all_prices.pp
         when 'm10'
                  @all_prices.m10 || @all_prices.pp
         when 'p10'
                  @all_prices.porog ? (@all_prices.porog + @all_prices.porog * 0.10) : @all_prices.pp
         when nil
                  @all_prices.pp
         else
                  @all_prices.pp
         end
 end

def get_price_type(user)
          #тип цены для пользователя
        if user.price1 == 'p10'
          session[:p_type] = 'p10' 
        elsif user.price1 == 'm10'
          session[:p_type] = 'm10'
        elsif user.price1 == 'm7'
          session[:p_type] = 'm7'
        elsif user.price1 == 'm5'
          session[:p_type] = 'm5'
        elsif user.price1 == 'm3'
          session[:p_type] = 'm3'
        else
          kontr = Kontragent.find_by_k1c(user.client.k1c).price_type if user.client and user.client.k1c and Kontragent.find_by_k1c(user.client.k1c)
          if kontr
            
            session[:p_type] = case kontr.chomp
                               when ''
                                 'pp'
                               when '000000004'
                                 'pp'
                               when '000000005'
                                 'm3'
                               when '000000006'
                                 'm5'
                               when '000000007'
                                 'm7'
                               when '000000020'
                                 'm10'
                               else 'pp'
                               end
          end
        end
end



# def findprice(k1c)
# user
# @price=Nprice1.find :first ,:conditions=>["k1c=?",k1c]
# if @user
# @price_spec=TovSpec.find(:first,:conditions=>['legal_id=? and k1c=?',@user.client_id,k1c])
# if @price_spec
#    @outprice = @price_spec.price_spec
# else
#    case @user.price1
#      when 'pp'
#        @outprice = @price.pp
#      when 'm3'
#        @outprice = @price.m3 || @price.pp
#      when 'm5'
#        @outprice = @price.m5 || @price.pp
#      when 'm7'
#        @outprice = @price.m7 || @price.pp
#      when 'm10'
#        @outprice = @price.m10 || @price.pp
#      when 'p10'
#        @outprice = @price.porog ? (@price.porog + @price.porog * 0.10) : @price.pp
#      else
#        @outprice = @price.pp
#    end
# end
# else
#   if @price
#    @outprice = @price.pp
#   else
#     Mailer.deliver_netf("Не положить в корзину #{request.remote_ip.to_s}, товар #{k1c} | #{request.request_uri}")
#   end
# end
#end


end
