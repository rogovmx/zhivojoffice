class Kt3Controller < ApplicationController
  layout 'vvk'

   require "will_paginate"

def kt3_st
  redirect_to :action=>'tov' , :id => params[:id]
end

def sitemap
render :layout => 'l_o1'
end


#def cart
#     user
#     if @user
#     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
#     else
#     @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
#     end
#     @cart_sum = @cart.sum {|e| e.quantity * e.price }
#end


def  per_page
   @per_page = session[:per_page] ? ((session[:per_page].to_i >= 11) ? session[:per_page].to_i : 20 ) : 20
end

def  per_page_v
    @per_page = session[:per_page] ? ((session[:per_page].to_i >= 11) ? session[:per_page].to_i : 18 ) : 18
end


  def sale3m

     session[:original_uri]=request.request_uri
     user
     cart
     #per_page
     @per_page=session[:per_page]
    if @per_page==nil
      @per_page=21
    end

    order1=params[:order]
   if order1=='nd'
     order='name desc'
   elsif order1=='na'
     order='name asc'
   elsif order1=='pa'
     order='price asc'
   elsif order1=='pd'
     order='price desc'
   end

  search = '3m'
 if (@user and  @user.role) != 'redaktor'
    if params[:order] ==nil
     @tg=Cat1.paginate :conditions=>["(name like ?  or brend like ?  or subbrend like ? or tg like ? )and vis=?",'%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%',1],:page => params[:page], :per_page =>@per_page,:order=> 'portg'
    elsif  params[:order] !=nil
     @tg=Cat1.paginate :conditions=>["(name like ?  or brend like ?  or subbrend like ? or tg like ? )and vis=?",'%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%',1], :page => params[:page], :per_page =>@per_page,:order=> order
    end
else
          if params[:order] ==nil
     @tg=Cat1.paginate :conditions=>["(name like ?  or brend like ?  or subbrend like ? or tg like ? )",'%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%'],:page => params[:page], :per_page =>@per_page,:order=> 'portg'
    elsif  params[:order] !=nil
     @tg=Cat1.paginate :conditions=>["(name like ?  or brend like ?  or subbrend like ? or tg like ? )",'%'+search+'%','%'+search+'%','%'+search+'%','%'+search+'%'], :page => params[:page], :per_page =>@per_page,:order=> order
    end
 end

  end


def set_category_tg(tg)
   tov3=Tov3.find_by_id(tg)
   tov2=Tov2.find_by_id(tov3.tov2_id)
   first=First1.find_by_id(tov2.first1_id) if tov2
   if first
   @category=first.kod.to_i / 100
   else
   @category = 0
   end
end

def set_category_tg2(tg)
   tov2=Tov2.find_by_id(tg)
   first=First1.find_by_id(tov2.first1_id) if tov2
   if first
   @category=first.kod.to_i / 100
   else
   @category = 0
   end
end

def set_category_tov(id)
   tov=Cat1.find_by_id(id)
   tov3=Tov3.find_by_id(tov.tov3_id)
   tov2=Tov2.find_by_id(tov3.tov2_id)
   first=First1.find_by_id(tov2.first1_id) if tov2
   if first
   @category=first.kod.to_i / 100
   else
   @category = 0
   end
end

def in_set?(tov3)
  @tov3_cat = Tov3.find(tov3).cat1.find(:all , :conditions => { :vis => 1} , :select => 'k1c').map(&:k1c)
  @sets = []
  for set_item in SetItem.all do
    if @tov3_cat.include?(set_item.k1c)
     @sets <<  set_item.cat1
    end
  end
    if @sets.any?
      return @sets.uniq
    else
      return false
    end
end





  def tg_v

     if Tov3.find :first , :conditions=>['id = ? and vis = ?', params[:id], 1]
     session[:original_uri]=request.request_uri
     user
     cart

    set_category_tg(params[:id])
    per_page_v

    @in_set = in_set?(params[:id])




    @btg=Btg1.find :first , :conditions=>['tg=?', params[:id]]



  if session[:city]=='msk'
    @city='and msk=?'
  elsif session[:city]=='smo'
    @city='and smo=?'
  else
    @city='and spb=?'
  end
  @zo_paper = Cat1.find :all , :conditions => ['(k1c = ? or k1c = ? or k1c = ?) and vis = ?', '7774973992' , '7774973987' , '7774973989', 1] , :order => 'price' if params[:id].to_i == 382
  @cat1s=Cat1.find :all , :conditions=>["vis=?  and tov3_id=? and not (name like ? or fullname like ?) #{@city} and raspr != ?",1,params[:id],'%'+'АКЦИЯ'+'%' ,'%'+'АКЦИЯ'+'%',1,1] , :order=>'price'
  @cat1s -= @zo_paper if @zo_paper
  @super = Cat1.find :all , :conditions=>['vis = ? and raspr = ? and tov3_id = ?', 1, 1, params[:id]] , :order => 'price'
  @act=Cat1.find :all , :conditions=>["vis=? and tov3_id=? and (name like ? or fullname like ?) #{@city}",1,params[:id],'%'+'АКЦИЯ'+'%','%'+'АКЦИЯ'+'%',1] , :order=>'price'


   
   if params[:order]=='nd'
   @cat1s.sort!{|a,b| b[:name] <=> a[:name]}
   elsif params[:order]=='na'
   @cat1s.sort!{|a,b| a[:name] <=> b[:name]}
   elsif params[:order]=='pd'
   @cat1s.sort!{|a,b| b[:price] <=> a[:price]}
   else
   @cat1s.sort!{|a,b| a[:price] <=> b[:price]}  
   end

   if @user and @user.city != 'Смоленск'
  @cat1s = @super + @cat1s if @super and @super.size != 0
  @cat1s = @act + @cat1s if @act and @act.size != 0
  @cat1s = @in_set + @cat1s if in_set?(params[:id])
  
   elsif @user and @user.city == 'Смоленск'

   else
     if session[:city] != 'smo'
   @cat1s = @super + @cat1s if @super and @super.size != 0 
   @cat1s = @act + @super + @cat1s if @act and @act.size != 0
   @cat1s = @in_set + @cat1s if in_set?(params[:id])
     end
   end

  @cat1s = @zo_paper + @cat1s if @zo_paper
  @cat1s += Cat1.find( :all , :conditions=>['vis = ? and tov3_id = ?' , 0 , params[:id]]) if redaktor?

 unless params[:btg]
session[:filtr]={}

    if params[:filtr]==nil
     @tg=@cat1s.paginate :page => params[:page], :per_page =>@per_page
    elsif  params[:filtr]!=nil 
     @tg=@cat1s.find_all{|a| a[:brend] == params[:filtr]}.paginate :page => params[:page], :per_page =>@per_page
    end

 else

if params[:del]
session[:filtr].delete(params[:s]) if session[:filtr]
redirect_to :action=>'tg_v', :id=>params[:id] unless session[:filtr]
else
unless session[:filtr] == nil
session[:filtr].merge!({params[:s] => params[:har]})
else
 session[:filtr]={params[:s] => params[:har]}
end
end

@goods2=@cat1s


      
for n in session[:filtr].keys do
btg_s_find(params[:btg],n,session[:filtr][n])

if (@goods2 & @goods).size != 0
@goods2 &= @goods
else

session[:filtr].delete(n)
flash[:notice] = "С данным набором характеристик товаров нет." 
end
end if session[:filtr]

@tg=@goods2.paginate  :page => params[:page], :per_page =>@per_page
 end

 else      #если нет такой записи в tov3
 redirect_to '/'
 end
end

# +++++++++++++++++++++++++++++++++++++++++++++++ end TG_V



 def btg_s_find(btg,par_s,har)

   @bcat=Bcat1.find :all , :conditions=>['btg1_id=?',btg]
   @tov=@bcat.map{|b|  b[:s1] if b.send('s'+par_s)==har}.compact
    @goods=[]
       for tov in @tov do
            if session[:city]=='msk'
            @city='and msk=?'
            elsif session[:city]=='smo'
            @city='and smo=?'
            else
            @city='and spb=?'
            end
          @good=Cat1.find :first , :conditions=>["k1c=? and vis=? #{@city}",tov,1,1] if tov

        @goods<<@good if @good
      end

 end

  def tg_v2

    @gr=Tov2.find_by_id(params[:id])
    
    if @gr
     session[:original_uri]=request.request_uri
     user
     cart
     per_page_v
     
     set_category_tg2(params[:id])

     @in_set = []
     @tgv2=1
      #@k=First1.find(:first,:conditions=> ["kod=?",params[:id]])
      
      @gr2=Tov3.find :all , :conditions=>['tov2_id=?',@gr.id],:order=>'ord', :select=>'id'
      @tgc=[]
      @act=[]
      @all_super = []
 for gr in @gr2 do
   if @user and  @user.role == 'redaktor'
   @tg2 = Cat1.find :all, :conditions=>['tov3_id=?',gr.id] , :order=>'price'
   @act1=[]
   @super = []
   else
    if session[:city]=='msk'
    @city='and msk=?'
    elsif session[:city]=='smo'
    @city='and smo=?'
    else
    @city='and spb=?'
    end
   @zo_paper = Cat1.find :all , :conditions => ['(k1c = ? or k1c = ? or k1c = ?) and vis = ?', '7774973992' , '7774973987' , '7774973989', 1] , :order => 'price' if params[:id].to_i == 99
   @act1=Cat1.find :all , :conditions=>["tov3_id=? and vis=? and (name like ? or fullname like ?) #{@city}",gr.id, 1,'%'+'АКЦИЯ'+'%' ,'%'+'АКЦИЯ'+'%',1], :order=>'price'
   @tg2 = Cat1.find :all, :conditions=>["tov3_id=? and vis=?  and not(name like ? or fullname like ?) #{@city} and raspr != ?",gr.id, 1 ,'%'+'АКЦИЯ'+'%' ,'%'+'АКЦИЯ'+'%',1 , 1], :order=>'price'
   @tg2 -= @zo_paper if @zo_paper
   @super = Cat1.find :all , :conditions=>['vis = ? and raspr = ? and tov3_id = ?', 1, 1, gr.id] , :order => 'price'
   @in_set += in_set?(gr.id) if in_set?(gr.id)
  end
   @tgc += @tg2 unless @tg2.empty?
   @act += @act1 unless @act1.empty?
   @all_super += @super unless @super.empty?

end




if params[:order]=='pa'  
  @tgc.sort!{|a,b| a[:price] <=> b[:price]}
   elsif params[:order]=='nd'
  @tgc.sort!{|a,b| b[:name] <=> a[:name]}
   elsif params[:order]=='na'
  @tgc.sort!{|a,b| a[:name] <=> b[:name]}
   elsif params[:order]=='pd'
  @tgc.sort!{|a,b| b[:price] <=> a[:price]}
end
if session[:city] != 'smo'
@tgc = @all_super + @tgc if @all_super and @all_super.size != 0
@tgc = @act + @tgc if @act and @act.size != 0
@tgc = @in_set.uniq  + @tgc if @in_set.any?

end
@tgc = @zo_paper + @tgc if @zo_paper
@max=@tgc.map{|a| a.price}.max
@tgc = @tgc.find_all{ |x| x.price <= params[:max].to_i and x.price > params[:min].to_i } if params[:min] and params[:max]
    if params[:filtr]==nil
     @tg=@tgc.paginate :page => params[:page], :per_page =>@per_page 
    elsif  params[:filtr]!=nil
     @tg=@tgc.find_all{|a| a[:brend] == params[:filtr]}.paginate :page => params[:page], :per_page =>@per_page
    end
    redirect_to '/' if @tg.empty?
    else
     redirect_to '/'
    end
  end

# +++++++++++++++++++++++++++++++++++++++++++++++ end TG_V2


 def tg_n

   if Tov3.find :first , :conditions=>['id = ? and vis = ?', params[:id], 1]
    session[:original_uri]=request.request_uri
     user
     cart
     per_page
     
 set_category_tg(params[:id])

 @in_set = in_set?(params[:id])
@btg=Btg1.find :first , :conditions=>['tg=?', params[:id]]

 if @user and @user.role == 'redaktor'
 @cat1s=Cat1.find :all , :conditions=>['tov3_id=?',params[:id]], :order=>'price'
 else
    if session[:city]=='msk'
  @city='and msk=?'
  elsif session[:city]=='smo'
  @city='and smo=?'
  else
  @city='and spb=?'
  end
  @zo_paper = Cat1.find :all , :conditions => ['(k1c = ? or k1c = ? or k1c = ?) and vis = ?', '7774973992' , '7774973987' , '7774973989', 1] , :order => 'price' if params[:id].to_i == 382
  @cat1s=Cat1.find :all , :conditions=>["vis=?  and tov3_id=? and not (name like ? or fullname like ?) #{@city} and raspr != ?",1,params[:id],'%'+'АКЦИЯ'+'%' ,'%'+'АКЦИЯ'+'%',1,1] , :order=>'price'
  @cat1s -= @zo_paper if @zo_paper
  @super = Cat1.find :all , :conditions=>['vis = ? and raspr = ? and tov3_id = ?', 1, 1, params[:id]] , :order => 'price'
  @act=Cat1.find :all , :conditions=>["vis=? and tov3_id=? and (name like ? or fullname like ?) #{@city}",1,params[:id],'%'+'АКЦИЯ'+'%','%'+'АКЦИЯ'+'%',1] , :order=>'price'
 end



   if params[:order]=='nd'
   @cat1s.sort!{|a,b| b[:name] <=> a[:name]}
   elsif params[:order]=='na'
   @cat1s.sort!{|a,b| a[:name] <=> b[:name]}
   elsif params[:order]=='pd'
   @cat1s.sort!{|a,b| b[:price] <=> a[:price]}
   else
   @cat1s.sort!{|a,b| a[:price] <=> b[:price]}
   end

  if session[:city] != 'smo'
  @cat1s = @super + @cat1s if @super and @super.size != 0  
  @cat1s=@act+@cat1s if @act and @act.size != 0
  @cat1s = @in_set + @cat1s if in_set?(params[:id])
  end

 unless params[:btg]
session[:filtr]={}

    if params[:filtr]==nil
     @tg=@cat1s.paginate :page => params[:page], :per_page =>@per_page
    elsif  params[:filtr]!=nil
     @tg=@cat1s.find_all{|a| a[:brend] == params[:filtr]}.paginate :page => params[:page], :per_page =>@per_page
    end

 else

if params[:del]
session[:filtr].delete(params[:s]) if session[:filtr]
redirect_to :action=>'tg_v' , :id=>params[:id] unless session[:filtr]
else
unless session[:filtr] == nil
session[:filtr].merge!({params[:s] => params[:har]})
else
 session[:filtr]={params[:s] => params[:har]}
end
end

@goods2=@cat1s



for n in session[:filtr].keys do
btg_s_find(params[:btg],n,session[:filtr][n])

if  (@goods2 & @goods).size != 0
@goods2 &= @goods
flash[:notice] = "С данным набором характеристик товаров нет." #if @goods2.size==0
else
session[:filtr].delete(n)
end
end if session[:filtr]

@tg=@goods2.paginate  :page => params[:page], :per_page =>@per_page
 end
 
  else      #если нет такой записи в tov3
  redirect_to '/'
 end

  end
# +++++++++++++++++++++++++++++++++++++++++++++++ end TG_N

   def tg_n2
      @gr=Tov2.find_by_id(params[:id])
     if @gr
       session[:original_uri]=request.request_uri
     user
     cart
      set_category_tg2(params[:id])
     @tgn=1
     @tgn2=1

     @in_set = []

      redirect_to '/' if @gr == nil or @gr.id == nil
      @gr2=Tov3.find :all , :conditions=>['tov2_id=?',@gr.id],:order=>'ord', :select=>'id'
      @tgc=[]
      @act=[]
      @all_super = []
 for gr in @gr2 do
   if @user and  @user.role == 'redaktor'
   @tg2 = Cat1.find :all, :conditions=>['tov3_id=?',gr.id], :order=>'price'
   @act1=[]
   @super = []
   else
         if session[:city]=='msk'
         @city='and msk=?'
         elsif session[:city]=='smo'
         @city='and smo=?'
         else
         @city='and spb=?'
         end
   @zo_paper = Cat1.find :all , :conditions => ['(k1c = ? or k1c = ? or k1c = ?) and vis = ?', '7774973992' , '7774973987' , '7774973989', 1] , :order => 'price' if params[:id].to_i == 99
   @act1=Cat1.find :all , :conditions=>["tov3_id=? and vis=? and (name like ? or fullname like ?) #{@city}",gr.id, 1,'%'+'АКЦИЯ'+'%' ,'%'+'АКЦИЯ'+'%',1], :order=>'price'
   @tg2 = Cat1.find :all, :conditions=>["tov3_id=? and vis=?  and not(name like ? or fullname like ?) #{@city} and raspr != ?",gr.id, 1 ,'%'+'АКЦИЯ'+'%' ,'%'+'АКЦИЯ'+'%',1 , 1], :order=>'price'
   @tg2 -= @zo_paper if @zo_paper
   @super = Cat1.find :all , :conditions=>['vis = ? and raspr = ? and tov3_id = ?', 1, 1, gr.id] , :order => 'price'
   @in_set += in_set?(gr.id) if in_set?(gr.id)
  end
   @tgc += @tg2 unless @tg2.empty?
   @act += @act1 unless @act1.empty?
   @all_super += @super unless @super.empty?
end
    per_page


if params[:order]=='pa'
  @tgc.sort!{|a,b| a[:price] <=> b[:price]}
   elsif params[:order]=='nd'
  @tgc.sort!{|a,b| b[:name] <=> a[:name]}
   elsif params[:order]=='na'
  @tgc.sort!{|a,b| a[:name] <=> b[:name]}
   elsif params[:order]=='pd'
  @tgc.sort!{|a,b| b[:price] <=> a[:price]}
end

if session[:city] != 'smo'
@tgc=@all_super+@tgc if @all_super and @all_super.size != 0 
@tgc=@act+@tgc if @act.size != 0 
@tgc= @in_set.uniq + @tgc if @in_set.any?
end

 @max=@tgc.map{|a| a.price}.max
@tgc = @tgc.find_all{ |x| x.price <= params[:max].to_i and x.price > params[:min].to_i } if params[:min] and params[:max]

   if params[:filtr]==nil
     @tg=@tgc.paginate :page => params[:page], :per_page =>@per_page
    elsif  params[:filtr]!=nil
     @tg=@tgc.find_all{|a| a[:brend] == params[:filtr]}.paginate :page => params[:page], :per_page =>@per_page
    end
  
    redirect_to(  :action => 'tg_n2' , :id=>params[:id]  ) if @tg.empty?
else
   redirect_to '/'
   end
  end
   


def create_cart 
  if request.xhr?
     user
     if @user
       @exist = Cart.find :first , :conditions=>['k1s=? and (User_id=? or Sesion_id=?)' , params[:cart][:k1s], @user.id, request.session_options[:id]] if params[:cart]
     else
       @exist = Cart.find :first , :conditions=>['k1s=? and Sesion_id=?' , params[:cart][:k1s], request.session_options[:id]] if params[:cart]
     end  #if params[:cart][:k1s] != '7774973992'



     if @exist
       @exist.quantity += params[:cart][:quantity].to_i 
       @exist.save
     else
       @cart = Cart.new(params[:cart])
       @cart.quantity = 1 if @cart.quantity == nil or @cart.quantity == '' or @cart.quantity == ' '
       @cart.price = findprice(@cart.k1s)
       @cart.save 
     end


 

     render :update do |page|
       page.replace_html 'top_cart', top_cart
       page.replace_html 'bar11', oc(params[:id])
       page.replace_html 'zakaz_'+ params[:id]  , :partial=>'/kt3/tvc'    
     end 
  
    
  else
    redirect_to '/'
  end
end

def top_cart
     cart
      render :partial=>'/part2/top_cart', :q_tov => @q_tov
end




def set
@cat=Cat1.find( :first , :conditions => ['id =? and vis =?', params[:id], 1])
user
cart
set_category_tov(params[:id])

@pict = @cat.cat1img[0].pic if @cat.cat1img and @cat.cat1img[0]


 @cat_set = []
   @cat.set_item.each do |x|
  @cat_set << x if Cat1.find( :first , :conditions=>{:k1c => x.k1c}) 
   end
   @cat_set.compact!
 #render :text => @cat_set.size.to_s

end



def tov
@cat=Cat1.find( :first , :conditions => ['id =? and vis =?', params[:id], 1]) #.reload


if @cat
  $num=0



@bcat1=Bcat1.find_by_s1(@cat.k1c)  #характеристики
@btg1=Btg1.find_by_id(@bcat1.btg1_id) if @bcat1     #характеристики


    if Tov3.find(@cat.tov3_id).vis
      redirect_to(:action => 'tg_v' , :id=>@cat.tov3_id)
    else
      redirect_to '/'
    end unless @cat.vis


user
cart
set_category_tov(params[:id])

   @picts=[@cat.pic1]
     for pic in @cat.cat1img do
       @picts<<pic.pic
     end

@tg=[]


     if @cat and @cat.collection_id
       @tg=Cat1.find :all , :conditions=>['collection_id=? and id!=? and vis=? ',@cat.collection_id,@cat.id,1]
     end

     if @cat.collection.size !=0
       for col in @cat.collection do
         @tmp=Cat1.find_by_k1c(col.k1c)
         @tg<<@tmp if @tmp and @tmp.vis
       end
     end



else
  redirect_to '/'
end

end




 def pic1
 @pic=params[:pic]
 render :partial =>'/part/pic1' , :pic => @pic
 end

  def pic2
 #@num=params[:num].to_i
 $num = 0 unless $num
 $num += 1 if params[:next]=='1'
 $num -= 1 if params[:next]=='-1'
 @cat=Cat1.find(params[:cat])
 @picts=[@cat.pic1]
     for pic in @cat.cat1img do
       @picts<<pic.pic
     end
 @pic=@picts[$num]
 $num=0 if ($num > 0 and $num >(@picts.size - 1)) or (@picts[$num] == @picts[0])
 @pic=@picts[$num]

 render :text =>"<img src=\"/img/#{@pic}.jpg\" />" 
 end

 

   def kanc1

     user
     session[:original_uri]=request.request_uri
    cart
     @k=First1.find_by_kod(params[:id])
    if @k
   # unless read_fragment(:fragment=>'kt3kanc1')
     #@k=First1.find(:first,:conditions=> ["kod=?",params[:id]])
    @gr2=Tov2.find(:all,:conditions=> ["first1_id=?",@k.id],:order=>'ord')

  #  end
    else
      redirect_to '/'
    end

   end


   def oc(id)
    cart

      render :partial=>'/part2/oc',:cart=>@cart , :st=>@st

   end

   def oc1
    cart
      render :partial=>'/part2/oc',:cart=>@cart

   end

  def del_tov
    user
    if @user and @user.role == "redaktor"
    Cat1.destroy(params[:id])
    end
    redirect_to :back
  end

   

   def show_menu1

    if params[:kod] == '1'
    @k=First1.find:all,:select=>"name ,kod, id",:conditions=>"kod >100 and kod <200" ,:order=>'kod'
    @name='Бумага и изделия из бумаги'
    elsif params[:kod] == '2'
    @k=First1.find:all,:select=>"name ,kod , id",:conditions=>"kod >200 and kod <300" ,:order=>'kod'
    @name='Хранение документов'
    elsif params[:kod] == '3'
    @k=First1.find:all,:select=>"name ,kod , id",:conditions=>"kod >300 and kod <400",:order=>'kod'
    @name='Канцелярские принадлежности'
    elsif params[:kod] == '4'
    @k=First1.find:all,:select=>"name ,kod , id",:conditions=>"kod >400 and kod <500" ,:order=>'kod'
    @name='Письменные приналежности'
    elsif params[:kod] == '5'
    @k=First1.find:all,:select=>"name ,kod, id",:conditions=>"kod >500 and kod <600" ,:order=>'kod'
    @name='Компьютеры и аксессуары'
    elsif params[:kod] == '6'
    @k=First1.find:all,:select=>"name ,kod, id",:conditions=>"kod >600 and kod <700" ,:order=>'kod'
    @name='Оргтехника'
    elsif params[:kod] == '7'
    @k=First1.find:all,:select=>"name ,kod, id",:conditions=>"kod >700 and kod <800" ,:order=>'kod'
    @name='Бытовая техника'
    elsif params[:kod] == '8'
    @k=First1.find:all,:select=>"name ,kod, id",:conditions=>"kod >800 and kod <900" ,:order=>'kod'
    @name='Интерьер'
    elsif params[:kod] == '9'
    @k=First1.find:all,:select=>"name ,kod, id",:conditions=>"kod >900 and kod <1000" ,:order=>'kod'
    @name='Продукты'
    elsif params[:kod] == '10'
    @k=First1.find:all,:select=>"name ,kod, id",:conditions=>"kod >1000 and kod <1100" ,:order=>'kod'
    @name='Товары для офисной жизни'
    end

     unless params[:all]
     render :update do |page|
       page.replace_html( 'left_menu2', :partial=>'/part2/left_menu2' ,:kod=>params[:kod] )
       page.replace_html( 'left_submenu', :partial=>'/part2/left_submenu' ,:k=>@k , :name=>@name )
       page.visual_effect(:blind_down, 'left_submenu', :duration=> 0.4)
     end
     else
       render :update do |page|
       page.replace_html( 'all_cont', :partial=>'/part2/all_cont' )
       page.replace_html( 'left_menu2', :partial=>'/part2/left_menu2' ,:kod=>params[:kod] )
       page.replace_html( 'left_submenu', :partial=>'/part2/left_submenu' ,:k=>@k , :name=>@name )
       page.visual_effect(:blind_down, 'all_cont', :duration=> 0.2)
     end

     end


   end

   def sale

     user
     cart
     per_page

@first = First1.find :all , :order => 'name'
if params[:search] and params[:search] != '' and params[:search].strip != ''
search = params[:search].downcase.strip
if session[:city] == 'msk'
  @sqlpar = 'msk = 1 and '
elsif  session[:city] == 'msk'
  @sqlpar = 'spb = 1 and '
else
  @sqlpar = ''
end
@search = Cat1.find :all , :conditions =>[" #{@sqlpar} vis = ? and raspr = ? and (brend like ? or name like ? or fullname like ?)" , 1, 2, '%' + search + '%','%' + search + '%' ,'%' + search + '%' ]
@tg = @search.sort{|a,b| a.price <=> b.price}.paginate :page => params[:page], :per_page =>@per_page

else
@old_p =[]
group = params[:id] || 13
@name = First1.find(group)
@name.tov2.each do |tov2|
  tov2.tov3.each do |tov3|
     @old_p += tov3.cat1.find_all{|f| f.vis and f.raspr == 2}
  end
end
@tg = @old_p.compact.paginate :page => params[:page], :per_page =>@per_page
end


   end

def school
  user
  cart
  per_page

  @first = First1.find :all , :order => 'name'
  @old_p =[]
  group = params[:id]
  if params[:id]
    @name = First1.find(group)
    @name.tov2.each do |tov2|
      tov2.tov3.each do |tov3|
        @old_p += tov3.cat1.find_all{|f| f.vis and f.raspr == 4}
      end
    end
    @tg = @old_p.compact.paginate :page => params[:page], :per_page =>@per_page
  else
    @old_p += Cat1.find(:all, :conditions=>['vis = ? and raspr =?', 1, 4])
    @tg = @old_p.compact.paginate :page => params[:page], :per_page =>@per_page
  end
end


 def sale_v
 #session[:original_uri]=request.request_uri
  sale

   end


    def newyear
     user
     cart
     per_page
     @raspr=Newyear.find :all , :select=>'k1c'
     @tg_tmp=[]
     for raspr in @raspr do
       @tmp=Cat1.find :first , :conditions=>["k1c=? and vis=? and k11=?",raspr.k1c,1,0]
      @tg_tmp << @tmp  if @tmp
     end
     @tg_tmp.sort!{|a,b| a.price <=> b.price}
     @tg=@tg_tmp.paginate  :page => params[:page], :per_page =>15

   end


 def newyear_v

  newyear

   end




 def sale_jule_s
  # redirect_to '/'
# session[:original_uri]=request.request_uri
     user
     cart
     per_page
     if session[:city] == 'msk' or (@user and @user.city == 'Москва')
     @raspr=Sale.find :all , :conditions=>['(spb is NULL and msk is NULL) or msk is not NULL'] , :select=>'k1c'
     elsif session[:city] == 'spb' or (@user and @user.city == 'Санкт-Петербург')
     @raspr=Sale.find :all , :conditions=>['(spb is NULL and msk is NULL) or spb is not NULL'] , :select=>'k1c'
     end
 
     @tg_tmp=[]
  
     for raspr in @raspr do
       @tmp=Cat1.find :first , :conditions=>["k1c=? and vis=?",raspr.k1c,1]
       @tg_tmp << @tmp  if @tmp
     end



     @tg_tmp.sort!{|a,b| a.price <=> b.price}
     @tg=@tg_tmp.paginate  :page => params[:page], :per_page =>15

   end




   def insale?(k1c)
    tmp = Sale.find :first , :conditions=>['k1c=?',k1c]
    if tmp
      return  true
    else
      return  false
    end
  end



 def novelty
#    user
#    cart
#    per_page
#
#@tmp=Cat1.find :all , :conditions=>["vis=? and created_at > ? and tg != ? and k11 != ? and raspr = ?",1,Time.now.prev_month.to_s(:db),'БОНУСЫ', 999, 0]
#@tg= (@tmp).paginate   :page => params[:page], :per_page =>@per_page
redirect_to '/'
 end

 def novelty_v
redirect_to '/'
 end

  def superprice
    user
    cart
    per_page_v



@first = First1.find :all , :order => 'name'

@old_p =[]
group = params[:id] || 12
@name = First1.find(group)
@name.tov2.each do |tov2|
  tov2.tov3.each do |tov3|
     @old_p += tov3.cat1.find_all{|f| f.vis and f.raspr == 1}
  end
end
@tg = @old_p.compact.paginate :page => params[:page], :per_page =>@per_page


  end









  def holiday
    user
    cart
    per_page_v

     @gift1=[]
    if  params[:holiday] == '1'
    @holiday_title = 'Подарки ко Дню всех влюбленных'
    @gifts = Gift.find :all , :conditions => ["holiday_id = ?", 1]
    @back = 'holiday.jpg'
    session[:gift] = 1
    elsif  params[:holiday] == '2'
    @holiday_title = 'Подарки ко Дню защитника Отечества'
    @gifts = Gift.find :all , :conditions => ["holiday_id = ?", 2]
    @back = 'holiday2.jpg'
    session[:gift] = 2
    elsif params[:holiday] == nil or params[:holiday] == '3'
    @holiday_title = 'Подарки к празднику весны'
    @gifts = Gift.find :all , :conditions => ["holiday_id = ?", 3]
    @back = 'holiday3.jpg'
    session[:gift] = 3
    elsif params[:holiday] == '4'
    @holiday_title = 'Подарки к празднику весны'
    @gifts = Gift.find :all , :conditions => ["holiday_id = ?", 4]
    @back = 'holiday3.jpg'
    elsif params[:holiday] == '5'
    @holiday_title = 'Подарки к празднику весны'
    @gifts = Gift.find :all , :conditions => ["holiday_id = ?", 5]
    @back = 'holiday3.jpg'
    elsif params[:holiday] == '6'
    @holiday_title = 'Подарки ко Дню защитника Отечества'
    @gifts = Gift.find :all , :conditions => ["holiday_id = ?", 6]
    @back = 'holiday2.jpg'
    elsif params[:holiday] == '7'
    @holiday_title = 'Подарки ко Дню защитника Отечества'
    @gifts = Gift.find :all , :conditions => ["holiday_id = ?", 7]
    @back = 'holiday2.jpg'
    end
       
    for gift in @gifts do
      tmp=Cat1.find :first , :conditions=>['k1c=? and vis=?',gift.k1c,1]
      @gift1<<tmp if tmp
    end

#     if params[:order]=='pa' or params[:order]=='nil'
     @gift1.sort!{|a,b| a[:price]<=>b[:price]}
#     elsif params[:order]=='pd'
#     @gift1.sort!{|a,b| b[:price]<=>a[:price]}
#     elsif params[:order]=='na'
#     @gift1.sort!{|a,b| a[:name]<=>b[:name]}
#     elsif params[:order]=='nd'
#     @gift1.sort!{|a,b| b[:name]<=>a[:name]}
#     end

     @tg=@gift1.paginate :page => params[:page], :per_page =>@per_page

  end



  def gifts
    user
    cart
    per_page_v
    @gift1=[]
    for gift in Gift.all do
      tmp=Cat1.find :first , :conditions=>['k1c=? and vis=?',gift.k1c,1]
      @gift1<<tmp if tmp and @gift1.find_all{|f| f.k1c  == tmp.k1c}.empty?
    end

     if params[:order]=='pa' or params[:order]=='nil'
     @gift1.sort!{|a,b| a.price <=> b.price}
     elsif params[:order]=='pd'
     @gift1.sort!{|a,b| b.price <=> a.price}
     elsif params[:order]=='na'
     @gift1.sort!{|a,b| a.name  <=> b.name}
     elsif params[:order]=='nd'
     @gift1.sort!{|a,b| b.name <=> a.name}
     end

     @tg=@gift1.compact.paginate :page => params[:page], :per_page =>@per_page

  end

#private
#
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
