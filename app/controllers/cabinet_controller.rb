class CabinetController < ApplicationController
  #layout 'kanct_admin'
    #layout 'l_o1'

    layout 'search'
    before_filter :authorize
    require "will_paginate"



  def per_page
    if session[:per_page] and session[:per_page] > 0
      @per_page = session[:per_page]
    else
      @per_page = 20
    end
  end


  def index
    redirect_to :action=>'reg_data'
  end

  def feedback
     user
    @menu=8
    @name = 'обратная связь'
    if request.post?
      feedback = Feedback.new(params[:feedback])
      feedback.save
      flash[:notice] = 'Сообщение отправлено'
      Mailer.deliver_feedback(feedback, @user)
    end

  end


  def order
  @months=['','января','февраля','марта','апреля','мая','июня','июля','августа','сентября','октября','ноября','декабря']
   user
   @menu=4
   @name = 'заказы'
  #   @order=Order.paginate :all,:conditions=>['client_id=?',@user.client1_id],:page => params[:page] , :per_page =>10
    if @user.client1_id == 0
      @order=Order.paginate :all,:conditions=>['user_id=?',@user.id],:page => params[:page] , :per_page =>25 , :order=>'created_at desc'
    else
      if @user.role2 == 's_user'
        @order=Order.paginate :all,:conditions=>['user_id=? or client_id=?',@user.id,@user.client1_id],:page => params[:page] , :per_page =>25 , :order=>'created_at desc'
      elsif @user.role == 'poduser'
        @order=Order.paginate :all,:conditions=>['user1_id=?',@user.id],:page => params[:page] , :per_page =>25 , :order=>'created_at desc'
      elsif @user.head == 0 #or @user.role3 == 'head'
      #@order=Order.paginate :all,:conditions=>['user_id=? or client_id=?',@user.id,@user.client1_id],:page => params[:page] , :per_page =>15 , :order=>'created_at desc'
        @order=Order.paginate :all,:conditions=>['user_id=? ',@user.id],:page => params[:page] , :per_page =>25 , :order=>'created_at desc'
      else
        @sotr = User.find :all , :conditions=>['head_id = ?' , @user.id] , :select =>'id' , :order => 'otdel'
        @ord_sotr = Order.find :all , :conditions=> ['(user_id=? or client_id=?) and user1_id is NULL',@user.id,@user.client1_id], :order=>'created_at desc'
        for sotr in @sotr do
          @tmp = Order.find(:all,:conditions=>['user1_id=?',sotr.id] , :order=>'created_at desc')
          @ord_sotr += @tmp if @tmp
        end

#        if @ord_sotr.size == 0
#        @order=Order.paginate :all,:conditions=>['user_id=? or client_id=?',@user.id,@user.client1_id],:page => params[:page] , :per_page =>15 , :order=>'created_at desc'
#        else
        @order=@ord_sotr.sort{|a,b| b.created_at <=> a.created_at}.paginate :page => params[:page] , :per_page =>25
#        end
      end
    end
  end

  def reports
      user
 @names=['','Января','Февраля','Марта','Апреля','Мая','Июня','Июля','Августа','Сентября','Октября','Ноября','Декабря']
 @today =  Time.now.day.to_s + ' ' + @names[Time.now.month.to_i].to_s + ' ' + Time.now.year.to_s
 @name = 'отчеты'

   if @user.client1_id == 0
    @order=Order.find :all,:conditions=>['user_id=?',@user.id] , :order=>'created_at desc'
    else
      if @user.head == 0 or @user.role3 == 'head'
      @order=Order.find :all,:conditions=>['user_id=? or client_id=?',@user.id,@user.client1_id] , :order=>'created_at desc'
      else
      @sotr = User.find :all , :conditions=>['head_id = ?' , @user.id] , :select =>'id' , :order => 'otdel'
         @ord_sotr = Order.find :all , :conditions=> ['(user_id=? or client_id=?) and user1_id is NULL',@user.id,@user.client1_id]
        for sotr in @sotr do
        @tmp = Order.find(:all,:conditions=>['user1_id=?',sotr.id] , :order=>'created_at desc')
        @ord_sotr += @tmp if @tmp
        end
        if @ord_sotr.size == 0
        @order=Order.find :all,:conditions=>['user_id=? or client_id=?',@user.id,@user.client1_id] , :order=>'created_at desc'
        else
        @order=@ord_sotr
        end
      end
    end




   # @order=Order.find :all,:conditions=>['user_id=? or client_id=?',@user.id,@user.client1_id] , :order=>'created_at desc'
  
    @otdel = @order.map{|m|  m.user1_id }.uniq
    @summa = @order.sum{ |p| p.summa  }

    @line=[]
    for order in @order do
      for line in order.lineitem do
      if @line.any?{ |elem| elem.k1c == line.k1c }
        for tmp in @line do
          tmp.quantity += line.quantity if tmp.k1c == line.k1c
        end
      else
      @line <<line
      end
      end
    end


  end

  
  def show_report
    user
     d1=params[:nd].split(' ')
     d2=params[:kd].split(' ')



 d1_day=d1[0]
 d1_year=d1[2]

 d1_month = case d1[1]
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

 d1_str = d1_year.to_s + "." + d1_month.to_s + "." + d1_day.to_s


 d2_day=d2[0]
 d2_year=d2[2]

 d2_month = case d2[1]
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

 d2_str = d2_year.to_s + "." + d2_month.to_s + "." + d2_day.to_s



    if params[:sotr] == "all"
    @order=Order.find :all,:conditions=>['(user_id=? or client_id=?) and created_at between ? and ?',@user.id,@user.client1_id, d1_str , d2_str.to_date + 1.day] , :order=>'created_at desc'
    else

      if @user.id.to_s == params[:sotr]
      @order=Order.find :all,:conditions=>['(user_id=? or client_id=?) and user1_id is NULL and created_at between ? and ?',@user.id,@user.client1_id, d1_str , d2_str.to_date + 1.day] , :order=>'created_at desc'
      else
      @order=Order.find :all,:conditions=>['(user_id=? or client_id=?) and user1_id=? and created_at between ? and ?',@user.id,@user.client1_id, params[:sotr] , d1_str , d2_str.to_date + 1.day] , :order=>'created_at desc'
      end
   end

    
    @summa = @order.sum{ |p| p.summa  }
     @line=[]
    for order in @order do
      for line in order.lineitem do
      if @line.any?{ |elem| elem.k1c == line.k1c }
        for tmp in @line do
          tmp.quantity += line.quantity if tmp.k1c == line.k1c
        end
      else
      @line <<line
      end
      end
  end

     render :update do |page|
      page.replace_html( 'details', :partial=>'show_report' ,:summa =>@summa , :line => @line  )
      page.visual_effect(:Highlight, 'details')

     end
     else

  end


  def allorders
    user
    @menu=4
   @name = 'Номенклатура заказов'
    if @user.client1_id == 0
    @order=Order.find :all,:conditions=>['user_id=?',@user.id], :order=>'created_at desc'
    else
    @order=Order.find :all,:conditions=>['user_id=? or client_id=?',@user.id,@user.client1_id] , :order=>'created_at desc'
    end
    @cat=[]
    @lineall=[]
    for order in @order do
    @line=Lineitem.find :all,:conditions=>['order_id=?',order.id] , :select=>'distinct k1c'
    @lineall+=@line
    end
    @lineall.map!{|x| x.k1c.strip}.uniq!
    for line in @lineall do
    @tmp=Cat1.find :first , :conditions=>['k1c=? and vis=?', line, 1]
    @cat << @tmp if @tmp
    end
    
    
    @cat.sort!{|a,b| a[:tov3_id] <=> b[:tov3_id] }

    @tg=@cat.paginate :page => params[:page], :per_page =>20
  end




  def order_details
    @order=Order.find(params[:id])
    if params[:sort]
     @line=Lineitem.find( :all,:conditions=>['order_id=?',@order.id]).sort{|a,b| Cat1.find_by_k1c(a.k1c).name <=> Cat1.find_by_k1c(b.k1c).name} if params[:sort] == 'alf'
    else
     @line=Lineitem.find :all,:conditions=>['order_id=?',@order.id]
    end
    render :partial=>'details',:line=>@line ,:order=>@order
  end

   def konkursorder_details
    @order=Konkursorder.find(params[:id])
     @line=Konkursitem.find :all,:conditions=>['konkursorder_id=?',@order.id]
    render :partial=>'konkursdetails' , :line=>@line ,:order=>@order
  end



 def reg_data
    user
      
      
      @menu=1
      @name = 'регистрационные данные'
      @manager = Kontragent.find_by_k1c(Client.find_by_id(@user.client_id).k1c) if @user.client_id

 end

 def favorits
   user
   @menu=2
   @name = 'избранные товары'
   #session[:original_uri]=request.request_uri
    #per_page

    
    @it_tov=It.find(:all,:conditions=>["user_id=?",@user.id])

    @it_tov.each do |it|
      tmp=Cat1.find :first , :conditions=>["k1c=? and vis=?",it.k1c , 1]
      it.destroy unless tmp
    end
    @it=It.find :all,:conditions=>["user_id=?",@user.id] , :order =>'created_at desc'
    @it.sort!{|a,b| Cat1.find_by_k1c(a.k1c).name <=> Cat1.find_by_k1c(b.k1c).name}
    @it_tov = @it.paginate :page => params[:page], :per_page =>20

 end



 def delete_it
   user
    uri=session[:original_uri]
   
   @it=It.find(:first,:conditions=>['user_id=? and k1c=?',@user.id,params[:k1c]])
   @it.destroy
   redirect_to(uri || '/')
end



 def tov_spec
   user
  @menu=3
   @name = 'договоры и спецификации'
   #session[:original_uri]=request.request_uri
   @per_page=20

   @spec = TovSpec.find(:all,:conditions=>["legal_id=?",@user.client_id])
   for spec in @spec do
     cat = Cat1.find_by_k1c(spec.k1c)
     if cat
      spec.tg3 = cat.tov3_id
      spec.tg2 = cat.tov3.tov2_id
      spec.tg1 = cat.tov3.tov2.first1_id
      spec.save
     end
   end
   
   @first_ids = TovSpec.find :all,:conditions=>["legal_id = ? and tg1 is not NULL ", @user.client_id ] , :select=>'distinct tg1' , :order=>'tg1'
   @first1_names = @first_ids.map {|m| [m.tg1 , First1.find(m.tg1.to_i).name]}
   @first1_names.sort! { |m0,m1| m0[1] <=> m1[1]  }



   unless params[:group]
   @it_tov=TovSpec.paginate(:all,:conditions=>["legal_id=?",@user.client_id], :order =>'price_spec',:page => params[:page], :per_page =>20 )
   else 
   @it_tov=TovSpec.paginate :all,:conditions=>["legal_id=? and tg1=?", @user.client_id,params[:group]], :order=>'tg2 , tg3 , price_spec' , :page => params[:page], :per_page =>20
   end
 end


 def sotr
   user
     @menu=6
   @name = 'сотрудники'
  if @user.role2 == 's_user'
   @sotr =  User.find( :all ,:conditions=>["client1_id=? and role=?",@user.client1_id,'poduser'])
  else
  @new_sotr = User.find( :all ,:conditions=>["head_id=? and role=? ",@user.id,'poduser'])
  @old_sotr = User.find( :all ,:conditions=>["client1_id=? and role=? and head_id is NULL",@user.client1_id,'poduser'])
   unless @new_sotr.empty?
   @sotr = @new_sotr
   else
   @sotr = @old_sotr
   end
  end
 end

 def del_sotr
   @del=User.find(params[:id])
   @del.destroy
   redirect_to :action=>'sotr'

 end

   def add_pod_user
     @menu=6
     @name = 'регистрация сотрудника'
     @main_user=User.find_by_id(session[:user_id])


    @user = User2.new(params[:user])

    if request.post?
      
      if @user.save
      @main_user.head = 1
      @main_user.save
      @sotr=User.find :all ,:conditions=>["client1_id=? and role2=? and head_id is NULL",@main_user.client1_id,'poduser']
      @sotr.each do |sotr|
         sotr.head_id = @main_user.id
         sotr.save
       end

      flash[:notice] = "Пользователь #{@user.name} зарегистрирован"
      rnd=rand(999999999999999999999999999999999999999999)
      conf=Confirm.new
      conf.user_id=@user.id
      conf.rnd=rnd
      conf.save
      Mailer.deliver_welcome_poduser(@user ,@user.password ,rnd)

      #Mailer.deliver_welcome(@user.mail,rnd)
     redirect_to :controller=>'cabinet',:action=>'sotr'
    end
    end
  end




 def poduser_cart
   user
   @sotr=User.find(params[:sotr])
   @cart=Cart.find :all,:conditions=>['User_id=? ',@sotr.id]
   render :partial=>'poduser',:cart=>@cart ,:user=>@user ,:sotr=>@sotr

 end



 def order_details_poduser
   user
    @order=Order.find(params[:id])
    @line = @order.lineitem
    render :partial=>'details_poduser' ,:line=>@line ,:order=>@order
  end




def edit_sotr

  @user=User2.find_by_id(params[:id])
  if request.post? and @user.update_attributes(params[:user11])
 
  
      flash.now[:notice] = "Пользователь #{@user.name} сохранен"
#      rnd=rand(999999999999999999999999999999999999999999)
#      conf=Confirm.new
#      conf.user_id=@user.id
#      conf.rnd=rnd
#      conf.save
#     # Mailer.deliver_welcome(@user , params[:user11][:password] , rnd)
     redirect_to :controller=>'cabinet',:action=>'sotr'
    end

end

 def chpass
  @user=User3.find_by_id(session[:user_id])
  if @user.update_attributes(params[:user11])
  redirect_to :controller=>'cabinet',:action=>'reg_data'
  end


 end

def edit_user
@name='редактирование пользователя'
@menu=1
@user=User.find_by_id(session[:user_id])
end



def edit_pass
  @user=User3.find_by_id(session[:user_id])
  @name='изменение пароля'
@menu=1

if request.post?
  if @user.update_attributes(params[:user11])
  flash[:notice] = 'Пароль изменен'
  redirect_to :controller=>'cabinet',:action=>'reg_data'
  else
  flash.now[:notice] = 'Пароль не изменен'
  end
end

end

def konkurs
user
@name='задания на конкурс'
@menu=7

@order=Konkursorder.find :all, :conditions=>['client_id=?',@user.client1_id]

end

def to_cart
  user
 @order=Order.find(params[:id])
 if @order.user_id == @user.id or @order.client_id == @user.client1_id
@line= @order.lineitem

@line.each do |line|
  @uprice=Nprice1.find_by_k1c(line.k1c)
  @cat=Cat1.find :first ,:conditions=>['k1c=? and vis=?', line.k1c, 1]
  if @cat
  @cart=Cart.new(:Sesion_id=>request.session_options[:id], :otdel=> "kanc" , :User_id=>@user.id, :k1s=> line.k1c, :price=> @uprice.pp ,  :quantity => line.quantity , :user1_id=>line.user1_id) 
  @cart.save
  end
end

flash[:notice] = "Заказ в корзине"
 end
redirect_to :back

end


end
