module ApplicationHelper
  
  def user_id
     @user=User.find_by_id(session[:user_id])
     if @user
       return @user.id
     else
       return 0
     end
  end
  
  def user_name
    @user=User.find_by_id(session[:user_id])
    return @user.scr_name
  end

  def login?
    if User.find_by_id(session[:user_id])
      return true
    else
      return false
    end

  end

    def redaktor?
      @user = User.find_by_id(session[:user_id])

    if @user and @user.role == 'redaktor'
      return true
    else
      return false
    end

  end

  
    def login_msk_spb?
    @user = User.find_by_id(session[:user_id])   
    
    if @user and @user.city != 'Смоленск'
      return true
    else
      return false
    end

  end
  


  def tov3all(id)
    @tov3=Tov3.find(id)
    @tov3all = Tov3.find :all , :conditions=>['tov2_id=?',@tov3.tov2_id]
    render :partial=>'/part2/tov3all', :tov3all=>@tov3all , :tov3=>@tov3
  end


  def hk(id)
    @tov3 = Tov3.find(id)
    @tov2 = @tov3.tov2 if @tov3
    @first = @tov2.first1 if @tov2
    @tov3all = Tov3.find :all , :conditions=>['tov2_id=? and vis=?',@tov3.tov2_id, 1], :order=>'ord'
    @first_all=First1.find :all  ,:order=>'name'
    render :partial=>'/part2/hk',:tov3=>@tov3,:tov2=>@tov2, :first => @first , :tov3all => @tov3all , :first_all => @first_all
  end


  def hk2(id)
    @tov2=Tov2.find(id)
    @gr=@tov2.name
    @first=@tov2.first1
    @tov3all = Tov3.find :all , :conditions=>['tov2_id=? and vis=?',@tov2.id, 1], :order=>'ord'
    @first_all=First1.find :all  ,:order=>'name'
    render :partial=>'/part2/hk2',:gr=>@gr,:tov2=>@tov2 , :tov3all => @tov3all , :first_all => @first_all
  end


  def hk_tov(id)
    @tov_hk=Cat1.find(id)
    @tov3_hk=Tov3.find(@tov_hk.tov3_id)
    @tov2_hk=Tov2.find_by_id(@tov3_hk.tov2_id)
    @first=First1.find_by_id(@tov2_hk.first1_id) if @tov2_hk
    @tov3all = Tov3.find :all , :conditions=>['tov2_id=? and vis=?',@tov3_hk.tov2_id, 1],:order=>'ord'
    @first_all=First1.find :all  ,:order=>'name'
    render :partial=>'/part2/hk_tov',:tov3_hk=>@tov3_hk, :htov_hk=>@tov_hk , :first_all => @first_all , :tov3all => @tov3all
  end

  def tov_h(id ,order,brend)
    
   #@tg=Cat1.find_by_sql(['select distinct tg from cat1s where tov3_id =?',id])
    #@tg=Cat1.find :all, :conditions=>['tov3_id =? and tg1=?',params[:id],1]
    if brend==nil and order==nil
       @tg=Cat1.paginate :conditions=>['tov3_id =? and tg1=?',id,1], :page => params[:page], :per_page =>  5,:order=> 'price'
    elsif brend==nil and order!=nil
       @tg=Cat1.paginate :conditions=>['tov3_id =? and tg1=?',id,1], :page => params[:page], :per_page =>  5,:order=> order
    elsif  brend!=nil and order==nil
       @tg=Cat1.paginate :conditions=>['tov3_id =? and tg1=? and brend=?',id,1,brend], :page => params[:page], :per_page =>  5,:order=> 'portg'
    else
       @tg=Cat1.paginate :conditions=>['tov3_id =? and tg1=? and brend=?',id,1,brend], :page => params[:page], :per_page =>  5,:order=> order
    end
    #if order==nil
    #@tg=Cat1.paginate :conditions=>['tov3_id =? and tg1=?',id,1], :page => params[:page], :per_page =>  10,:order=> 'portg'
    #else
    #@tg=Cat1.paginate :conditions=>['tov3_id =? and tg1=?',id,1], :page => params[:page], :per_page =>  10,:order=> order
    #end
    
      render :partial=>'/part/tov_h',:tg=>@tg
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
         else
                  @all_prices.pp if @all_prices
         end
 end




#def findprice(k1c)
# @user=User.find_by_id(session[:user_id])
#
#  @price=Nprice1.find :first ,:conditions=>["k1c=?",k1c]
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
# @outprice = @price.pp
# end
#
#  return @outprice
#end





def get_old_price(k1c)
  @o_pr = Nprice1.find( :first ,:conditions=>["k1c=?",k1c]).p1_old
  return @o_pr
end



  def novelty?(created_at)
    if created_at > Time.now.prev_month
      return  true
    else
      return false
    end
  end


  def insale?(id)

First1.find(id).tov2.each do |tov2|
  tov2.tov3.each do |tov3|
   tmp =  tov3.cat1.find :first , :conditions => ['vis = ? and raspr = ?', 1, 2]
      return true if tmp
  end

end
      return false

  end

  def inschool?(id)

First1.find(id).tov2.each do |tov2|
  tov2.tov3.each do |tov3|
   tmp =  tov3.cat1.find :first , :conditions => ['vis = ? and raspr = ?', 1, 4]
      return true if tmp
  end

end
      return false

  end

def analog_any?(cat)
  @analogs = cat.analog
if @analogs
  @analogs = @analogs[0..5].compact
  @a_cat = []
  for analog in @analogs do
    @a_cat << Cat1.find( :first , :conditions => ['vis =? and k1c = ?' ,1 , analog.k1c])
  end
@a_cat.compact!
end
if @analogs and @a_cat and @a_cat.any?

  return true
else
  return false
end

end

def old_price?(k1c)
  tmp = Nprice1.find :first , :conditions =>['k1c = ?' , k1c ] , :select => 'p1_old'
   if tmp and tmp.p1_old
      return true
    else
      return false
    end
end

def inraspr?(id)
@old_p = []
First1.find(id).tov2.each do |tov2|
  tov2.tov3.each do |tov3|
   tmp =  tov3.cat1.find :first , :conditions => ['vis = ? and raspr = ?', 1, 1]
   @old_p <<  tmp if tmp
   if @old_p.any?
     break
   end
  end
   if @old_p.any?
     break
   end
end
   if @old_p.any?
      return true
    else
      return false
    end

end




   def tagcloud
     order='por'
     if @category
     @tagc = TagCloud.find :all , :conditions=>['category=?',@category] ,:order =>order  
     else
     @tagc = TagCloud.find :all , :conditions=>['category=?',0] ,:order =>order
     end
     render :partial=>'/part/tagcloud',:tagc=>@tagc
   end


   def messager_m
     @user=User.find_by_id(session[:user_id])
     
   end

   def oc(id)
     if id==0
     @st=0
     else
       
      @cat1=Cat1.find(id)
      @st=Cat1.find :first , :conditions=>['id=?',@cat1.st]
      #@st=@cat1.st
     end
      @user=User.find_by_id(session[:user_id])
       if @user
     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     @cart_count=Cart.count :conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     else
       @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
        @cart_count=Cart.count :conditions=>['sesion_id=?',request.session_options[:id]]
     end
     @cart_sum_bonus=0
     @cart_bonus=Cart.find :all,:conditions=>[' sesion_id=? and otdel != ?',request.session_options[:id],'raspr']

     @cart_bonus.each do |cart1|
       @cart_sum_bonus+=cart1.price*cart1.quantity if cart1.price
     end
     @cart_sum=0
     @cart.each do |cart|
       @cart_sum+=cart.price*cart.quantity  if cart.price
     end


      render :partial=>'/part2/oc',:cart=>@cart

   end

    def btg1har?(id,par_s,edit)
    #@btg1har=Btg1har.find :all , :conditions=>['btg1_id=? and s=?',id,s]
    
    @tmp=Bcat1.find :all , :conditions=>['btg1_id=?',id]
    @btg1har=@tmp.map{|b| [b.send('s'+par_s),b.send('s'+par_s)]}.compact
    
     @btg1har.unshift(['no', 'no'])  if edit=='no'
      
    if @btg1har.size != 0
         return true
    else
        return false
    end
  end

    def cat1har?(id,par_s)
    #@btg1har=Btg1har.find :all , :conditions=>['btg1_id=? and s=?',id,s]

    @tmp=Bcat1.find :all , :conditions=>['btg1_id=?',id]
    @btg1har=@tmp.map{|b| b.send('s'+par_s) if b.send('s'+par_s) != 'no'}.compact.uniq.sort
    
    if @btg1har.uniq.size > 1
         return true
    else
        return false
    end
  end

   def btg_s_find?(btg,par_s,har)

   @bcat=Bcat1.find :all , :conditions=>['btg1_id=?',btg]
   @tov=@bcat.map{|b|  b[:s1] if b.send('s'+par_s)==har}.compact
    #@goods=[]
       for tov in @tov do
        @good=Cat1.find :first , :conditions=>['k1c=? and vis=?',tov,1] if tov
       # @goods<<@good if @good
      end
      if @good
         return true
    else
        return false
    end
 end
 
   
 def already_bought(k1c)
   unless login?
    return 0
   else
    lineitems = []
    orders = Order.find :all , :conditions => ['user_id =? and created_at > ?', @user.id , "('2013-07-17')"]
    orders.each { |item| lineitems += item.lineitem  }
    li = lineitems.find_all{|a| a.k1c == k1c}.map(&:quantity)
    if li and li.any?
      return li.sum
    else
      return 0
    end
   end
   
 end


 def quant_in_cart(k1c)
     if login?
     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     else
     @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
     end

   @tmp = @cart.find_all { |e| e.k1s == k1c }
   if @tmp
     return @tmp.sum{|s| s.quantity}
   else
     return 0
   end


 end
   
    

   def acts_paper
     #show=rand(1)+1
     render :partial=>'/part2/act_paper1' , :show=>1
   end

  def acts_mebel
     @show=rand(1)+1
     session[:show_mebel] = @show
     render :partial=>'/part2/act_mebel' , :object=>@show
  end

  def actions_index
     @show=1
     session[:show_act_index] = @show
     render :partial=>'/part2/actions_index' , :object=>@show
  end


    def acts_always
     @show=1
     render :partial=>'/part2/act_always' , :object=>@show
   end

 def top_cart
@user = User.find(session[:user_id]) if session[:user_id]

  if @user
     @q_tov=Cart.find( :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]] , :select=>"quantity").sum{|x| x.quantity}
  else
     @q_tov=Cart.find(:all,:conditions=>[' sesion_id=?',request.session_options[:id]], :select=>"quantity").sum{|x| x.quantity}
  end
  render :partial=> '/part2/top_cart' , :q_tov => @q_tov
 end



    
   
  def foo1
    @podvals = Podval.find :all , :conditions=>['vis=?', 1]
    @podval = Podval.find_by_main(1)
    if @podval == nil
      @podvals = Podval.find_all_by_vis(1)
      @podval = @podvals.choice
    end
      # show=rand(2)+1
    render :partial => 'part/podval', :podval => @podval , :podvals => @podvals
  end

   def comics
     #show=rand(2)+1
     
     #if show == 1
      render :partial=>'/part/comics1'
         #elsif show == 2
     #  render :partial=>'/part/comics3'
     #elsif show == 3
       #render :partial=>'/part/comics2'
    # end
   end

  def img_cat(name)
    if name and name.strip != '' and FileTest::exist?("public/img/#{name}.jpg")
      return "/img/#{name}.jpg"
    else
      return '/images/no_image_s.gif'
    end

  end


   
end
