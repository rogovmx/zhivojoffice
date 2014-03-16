class Bas1Controller < ApplicationController
  layout 'bas1'
  

def msg4head
  user
  Mailer.deliver_msg4head(@user)
  render :update do |page|
  page.replace_html( 'msg4head', :text=>'Сообщение отправлено')
  end
end

   


  def edit_cart
   # user
    cart


      if @user
      redirect_to :action=>'no_ver' if @cart_count == 0 and  @user.role != 'redaktor'
      else
      redirect_to :action=>'no_ver' if @cart_count == 0
      end

    session[:bas_sort] = nil if params[:sort] == 'no'

    if session[:bas_sort] == nil
      if params[:sort] == 'name'
      @cart.sort!{|a,b| Cat1.find_by_k1c(a.k1s).name <=> Cat1.find_by_k1c(b.k1s).name }
      session[:bas_sort] = 'name_up'
      elsif params[:sort] == 'price'  
      @cart.sort!{|a,b| a.price <=> b.price}
      session[:bas_sort] = 'price_up'
      end
    elsif session[:bas_sort] == 'name_up'
      if params[:sort] == 'name'
      @cart.sort!{|a,b| Cat1.find_by_k1c(b.k1s).name <=> Cat1.find_by_k1c(a.k1s).name }
      session[:bas_sort] = 'name_down'
      elsif params[:sort] == 'price'  
      @cart.sort!{|a,b| a.price <=> b.price}
      session[:bas_sort] = 'price_up'
      end
    elsif session[:bas_sort] == 'name_down'
      if params[:sort] == 'name'
      @cart.sort!{|a,b| Cat1.find_by_k1c(a.k1s).name <=> Cat1.find_by_k1c(b.k1s).name }
      session[:bas_sort] = 'name_up'
      elsif params[:sort] == 'price'  
      @cart.sort!{|a,b| a.price <=> b.price}
      session[:bas_sort] = 'price_up'
      end  
    elsif session[:bas_sort] == 'price_up'
      if params[:sort] == 'name'
      @cart.sort!{|a,b| Cat1.find_by_k1c(a.k1s).name <=> Cat1.find_by_k1c(b.k1s).name }
      session[:bas_sort] = 'name_up'
      elsif params[:sort] == 'price'  
      @cart.sort!{|a,b| b.price <=> a.price}
      session[:bas_sort] = 'price_down'
      end    
    elsif session[:bas_sort] == 'price_down'
      if params[:sort] == 'name'
      @cart.sort!{|a,b| Cat1.find_by_k1c(a.k1s).name <=> Cat1.find_by_k1c(b.k1s).name }
      session[:bas_sort] = 'name_up'
      elsif params[:sort] == 'price'  
      @cart.sort!{|a,b| a.price <=> b.price}
      session[:bas_sort] = 'price_up'
      end    
      
    end

    
    


   if @user

    @client = Client.find(@user.client1_id) if @user.client1_id != 0

    # сотрудники
      @sotr = [User.new]
    @new_sotr = User.find( :all ,:conditions=>["head_id=? and role2=? ",@user.id,'poduser'])
    @old_sotr = User.find( :all ,:conditions=>["client1_id=? and role2=? and head_id is NULL",@user.client1_id,'poduser'])
      unless @new_sotr.empty?
        @sotr += @new_sotr
      else
        @sotr += @old_sotr
      end

    # -------------   сотрудники


    @act_sum = Cart.find(:all,:conditions=>['(User_id=? or sesion_id=?) and (k1s = ? or k1s = ? or k1s = ? )',@user.id,request.session_options[:id], '7774975413' , '7774975534' , '7774975535' ]).inject(0){|res, el| res+= el.price * el.quantity}
    @sum_wihiout_act = @cart_sum - @act_sum
    Actcard.delete_all(['user_id =? and used =?' , @user.id , 0]) if @sum_wihiout_act < 10000
  
    @actcards_now = Actcard.find :all , :conditions=>['user_id =? and used =?' , @user.id , 0]
    @actcards_now_count = @actcards_now.inject(0){|res, x| res + x.quantity}
    @ac = ((@cart_sum - @act_sum).to_i / 5000) - @actcards_now_count.to_i

     end

   # @esselte = Cat1.find :all , :conditions=>['name like ? and vis = ?','%'+'Esselte №1'+'%',1]


 #@e_k1c = @esselte.map{|m| m.k1c}
 #@act = @cart.inject(0){|res, el| res + el.quantity if @e_k1c.include?(el.k1s) and el.quantity != nil} and @cart != nil


# if @act
# @esselte = Cat1.find :all , :conditions=>['(kpk like ? or kpk like ?) and vis = ?','030257' , '030258',1] if @act >= 5 and @act < 10
# @incg = Cartgift.find(:all , :conditions => ['user_id = ?' , @user.id]).inject(0){|res, el| res + el.quantity}
# @nomore = @act / 10 - @incg
# end


  #@act = Cart.find(:all , :conditions=>['(k1s = ? or k1s = ? or k1s = ?) and user_id = ?', '7774964987' , '7774964988' , '7774964989' , @user.id])
  #@sum_act=@act.inject(0){|result, elem|  result + elem.quantity*elem.price}
  #@quant_act = @act.sum{|s| s.quantity}
  #@all_act = (((@cart_sum - @sum_act)/5000)).to_i*35
  #@num = @all_act - @quant_act

 

  end
  
  def set_act_card
    user
 

    @act_card = Actcard.new
    @act_card.name = "Карта Спортмастер (#{params[:nominal]}р)" if params[:id] == '1'
    @act_card.name = "Карта Икея (#{params[:nominal]}р)" if params[:id] == '2'
    @act_card.name = "Карта Рив Гош (#{params[:nominal]}р)" if params[:id] == '3'
    @act_card.name = "Карта Мвидео (#{params[:nominal]}р)" if params[:id] == '4'
    @act_card.name = "Карта Лэтуаль (#{params[:nominal]}р)" if params[:id] == '5'
    @act_card.quantity = 1
    @act_card.user_id = @user.id
    @act_card.save

#   if @user
#    @actcards_now = Actcard.find :all , :conditions=>['user_id =? and used =?' , @user.id , 0]
#    @actcards_now_count = @actcards_now.sum{|x| x.quantity}
#    @ac = (@cart_sum.to_i / 15000) - @actcards_now_count.to_i
#   end
redirect_to :action => 'edit_cart'
#    render :update do |page|
#    page.replace_html( 'act_card', :partial=>'/part2/actcard' , :ac=>@ac  , :actcards_now => @actcards_now)
#    end
  end



def del_act_card
 user
 Actcard.delete_all(['user_id =? and used =?' , @user.id , 0])
 redirect_to :action => 'edit_cart'
end  
  
 
  
  


  def create_cart_bas
     user
     #@all_c = Cart.find :all
     if @user
     #@exist = Cart.find :first , :conditions=>['k1s=? and (User_id=? or Sesion_id=?)' , params[:cart2][:k1s], @user.id, request.session_options[:id]] if params[:cart2]
     @exist = Cart.find :first , :conditions=>['k1s=?and (User_id=? or Sesion_id=?)' , params[:cart][:k1s], @user.id, request.session_options[:id]] if params[:cart]
     else
     # @exist = Cart.find :first , :conditions=>['k1s=? and  Sesion_id=?' , params[:cart2][:k1s], request.session_options[:id]] if params[:cart2]
     @exist = Cart.find :first , :conditions=>['k1s=?and Sesion_id=?' , params[:cart][:k1s], request.session_options[:id]] if params[:cart]
     end

       if @exist
       @exist.quantity += params[:cart][:quantity].to_i if params[:cart]
       #@exist.quantity += params[:cart2][:quantity].to_i if params[:cart2]
       @exist.save
     else

    @cart = Cart.new(params[:cart2]) if params[:cart2]
    @cart = Cart.new(params[:cart]) if params[:cart]
    @cart.quantity = 1 if @cart.quantity == nil or @cart.quantity == '' or @cart.quantity == ' '
    
    @cart.price = findprice(@cart.k1s)
    @cart.save
      end
      redirect_to :controller=>'bas1' , :action=> 'edit_cart'
end


def addcartgift
 @cartgift = Cartgift.new(params[:cartgift])
 @cartgift.save
 redirect_to :controller=>'bas1' , :action=> 'edit_cart'
end


def delcartgiftitem
  user
  @del = Cartgift.find(params[:id])
  @del.destroy if @user.id == @del.user_id
  redirect_to :controller=>'bas1' , :action=> 'edit_cart'

end


  def konkurs
    @user=User.find_by_id(session[:user_id])

    @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
    @cat1=[]
    @cart.each { |cart| @cat1 << cart.k1s }
    render :layout=>'vvk_fw'

  end

    def konkurs2
    session[:konkurs_id]=params[:id]

    @user=User.find_by_id(session[:user_id])

    @line=Konkursitem.find :all , :conditions=>['konkursorder_id=?' , params[:id]]
    @cat1=[]
    @line.each {|cart| @cat1 << cart.k1s }



  end



  def konkurs_save
   user
   cart

   @client = Client.find(@user.client1_id) if @user and @user.client1_id != 0
   order = Konkursorder.new(:user_id=>@user.id , :client_id=>@client.id)


     for cart in @cart do
       order.konkursitem << Konkursitem.new(:k1s =>cart.k1s ,:price=>cart.price ,:quantity =>cart.quantity ,:otdel=>cart.otdel,:user1_id=>@user.id)
     end
     order.save

    flash[:notice] = 'Задания на конкурс сохранены'
    redirect_to :back

  end



  def del_cart
     user
     if @user
       Cart.delete_all(['User_id=?',@user.id])
       Cart.delete_all(['sesion_id=?',request.session_options[:id]])
     else
        Cart.delete_all(['sesion_id=?',request.session_options[:id]])
     end
    redirect_to :action=>'edit_cart'
  end


  def edit_cart_item
    user
    if @user
      cart_item=Cart.find :first,:conditions=>['k1s=? and User_id=?',params[:k1s],@user.id]
    else
      cart_item=Cart.find :first,:conditions=>['k1s=? and sesion_id=?',params[:k1s],request.session_options[:id]]
    end
      cart_item.quantity=params[:quantity]
      cart_item.save
    redirect_to :action => "edit_cart"
    
  end

  def u1
    user
    Cart.update(params[:cart].keys ,params[:cart].values)

    for a in params[:cart].keys do
      tmp=Cart.find(a)
      if tmp.quantity == nil or tmp.quantity == 0
        tmp.quantity=1
        tmp.save
      end
 # cart
      #костыль для бумаги изумруд
#      if tmp.k1s == '7774973992' and tmp.quantity > 25  and tmp.quantity <= 300
#        tmp.price = 113
#        tmp.save
#      elsif  tmp.k1s == '7774973992' and tmp.quantity <= 25
#        findprice('7774973992')
#        tmp.price = @outprice
#        tmp.save
#      end
    end

    redirect_to :back
  end


 def u1_poduser
    user
    Cart.update(params[:cart].keys ,params[:cart].values)
    for a in params[:cart].keys do
      tmp=Cart.find(a)
      if tmp.quantity == nil or tmp.quantity == 0
        tmp.quantity=1
        tmp.save
      end
    end
    @sotr=User.find(params[:us])
    @cart=Cart.find :all,:conditions=>['User_id=? ',@sotr.id]
    render :partial=>'/cabinet/poduser',:cart=>@cart ,:user=>@user ,:sotr=>@sotr
 end



 def del_cart_item
    user

    if @user
      cart_item=Cart.find :first,:conditions=>['User_id=? and k1s=?',@user.id,params[:k1s]]
      cart_item.destroy if cart_item
    else
      cart_item=Cart.find :first,:conditions=>['sesion_id=? and k1s=?',request.session_options[:id],params[:k1s]]
      cart_item.destroy if cart_item
    end
    redirect_to :back
 end

   def del_cart_item_poduser
    user
    cart_item=Cart.find :first,:conditions=>['user_id=? and k1s=?',params[:us],params[:k1s]]
    cart_item.destroy
    @sotr=User.find(params[:us])
    @cart=Cart.find :all,:conditions=>['User_id=? ',@sotr.id]
    render :partial=>'/cabinet/poduser',:cart=>@cart ,:user=>@user ,:sotr=>@sotr
  end

  def priem_poduser
     user
     cart_item=Cart.find :first,:conditions=>['user_id=? and k1s=?',params[:us],params[:k1s]]
     cart_item.User_id=@user.id
     cart_item.user1_id = nil
     cart_item.save
     @sotr=User.find(params[:us])
     @cart=Cart.find :all,:conditions=>['User_id=? ',@sotr.id]
     render :partial=>'/cabinet/poduser',:cart=>@cart ,:user=>@user ,:sotr=>@sotr
  end


 def oz
  user
  if @user
#    @client=Client.find(@user.client1_id)
    redirect_to :action=>'oz1'
  else
    redirect_to :controller=>'login',:action=>'login'
  end
 end


  def oz1
    user
    cart
    rnd=rand(999999999999999999999999999999999999999999)
    conf=Confirm.new
    conf.user_id=@user.id
    conf.rnd=rnd
    conf.save

    order=Order.new(params[:order])

    summa=0

   for cart in @cart do
#    if cart.k1s == '7774973992' and cart.quantity > 25  and cart.quantity <= 300 #Костыль для  Изумруда по 113
#       order.lineitem << Lineitem.new(:k1c =>cart.k1s ,:price=>113 ,:quantity =>cart.quantity ,:otdel=>cart.otdel,:user1_id=>cart.user1_id)
#       summa+=(113 * cart.quantity)
#    elsif cart.k1s == '7774973992' and cart.quantity > 300 #Костыль для  Изумруда по 113
#       order.lineitem << Lineitem.new(:k1c =>cart.k1s ,:price=>findprice(cart.k1s) ,:quantity =>cart.quantity ,:otdel=>cart.otdel,:user1_id=>cart.user1_id)
#      m300 =   cart.quantity - 300
#       summa = 113 * 300 + findprice('7774973992') * m300
#    else
       order.lineitem << Lineitem.new(:k1c =>cart.k1s ,:price=>findprice(cart.k1s) ,:quantity =>cart.quantity ,:otdel=>cart.otdel,:user1_id=>cart.user1_id)
       summa+=(findprice(cart.k1s) * cart.quantity) if findprice(cart.k1s)
#     end
    end
      order.summa=summa
      order.save


      card = session[:card] || ''
      @catcod = Catcod.find_by_kod(session[:catcod]) if session[:catcod]
        if @catcod
          card += ' Код: ' + session[:catcod]
          @catcod.zakaz = order.id
          @catcod.user_id = @user.id
          @catcod.save
        end
      @actcards_now = Actcard.find :all , :conditions=>['user_id =? and used =?' , @user.id , 0]
      card += "<br/>" + 'Акция: карта в подарок: ' if @actcards_now.size > 0
      @actcards_now.each do |acn|
        card += acn.name
        acn.order_id = order.id
        acn.used = 1
        acn.save
      end

      Mailer.deliver_zakaz1(order , card , @user)
      Mailer.deliver_zakaz1user(order, rnd , card) if @user.mail
      Cart.delete_all(['User_id=?',@user.id])
      Cart.delete_all(['sesion_id=?',request.session_options[:id]])

end


def oz_poduser
   user
   @cart=Cart.find :all,:conditions=>['user1_id=?',params[:us]]
   #sum=@cart.sum{|s| s.price*s.quantity}
   order=Order.new(params[:order])
   
  summa=0
   for cart in @cart do
#    if cart.k1s == '7774973992' and cart.quantity > 25  and cart.quantity <= 300 #Костыль для  Изумруда по 113
#       order.lineitem << Lineitem.new(:k1c =>cart.k1s ,:price=>113 ,:quantity =>cart.quantity ,:otdel=>cart.otdel,:user1_id=>cart.user1_id)
#       summa+=(113 * cart.quantity)
#    elsif cart.k1s == '7774973992' and cart.quantity > 300 #Костыль для  Изумруда по 113
#       order.lineitem << Lineitem.new(:k1c =>cart.k1s ,:price=>findprice(cart.k1s) ,:quantity =>cart.quantity ,:otdel=>cart.otdel,:user1_id=>cart.user1_id)
#      m300 =   cart.quantity - 300
#       summa = 113 * 300 + findprice('7774973992') * m300
#    else
       order.lineitem << Lineitem.new(:k1c =>cart.k1s ,:price=>findprice(cart.k1s) ,:quantity =>cart.quantity ,:otdel=>cart.otdel,:user1_id=>cart.user1_id)
       summa+=(findprice(cart.k1s) * cart.quantity) if findprice(cart.k1s)
#     end
    end

      order.summa = summa
      order.save
      usr = User.find(order.user_id)
      Mailer.deliver_zakaz2(order, usr)
      Cartgift.delete_all(['user_id=?',@user.id])
      Cart.delete_all(['user1_id=?',params[:us]])


   redirect_to :controller=>'cabinet',:action=>'sotr' if params[:su]

   render :action => 'oz1' unless params[:su]


end

def no_ver
 #render :layout=>'vvk'
end


private

# def findprice(k1c)
# user
# @price=Nprice1.find :first ,:conditions=>["k1c=?",k1c]
# if @user
#  @price_spec=TovSpec.find(:first,:conditions=>['legal_id=? and k1c=?',@user.client_id,k1c])
#  if @price_spec
#    @outprice = @price_spec.price_spec
#  elsif @price
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
#   end
#  else
# @outprice = @price.pp
# end
#end




end
