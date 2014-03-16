class CollectionsController < ApplicationController
  # GET /collections
  # GET /collections.xml
  before_filter :authorize
  before_filter :redaktor
  layout 'search_nofoot'
  require "will_paginate"
   def user
    @user=User.find_by_id(session[:user_id])
   end

   def cart

    user
     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
  end

  def newcol
    cart
   
    @cat=[]
    for cart in @cart do
      tmp=Cat1.find_by_k1c(cart.k1s)
      @cat<<tmp if tmp
    end
    @newcol=Collection.new(:collection=>1, :cat1_id=>nil, :k1c=>nil)
    @newcol.save
    for cat in @cat do
   cat.collection_id = @newcol.id
   cat.save
    end
   Cart.delete_all(['User_id=?',@user.id])
   Cart.delete_all(['sesion_id=?',request.session_options[:id]])
   flash[:notice] = 'коллекция создана'
   redirect_to :back
  end

    def newst
    cart
    @cat=[]
    for cart in @cart do
      tmp=Cat1.find_by_k1c(cart.k1s)
      @cat<<tmp if tmp
    end
  for cat in @cat do
#   if cat.collection_id
#     @tmp=Collection.find_by_id(cat.collection_id)
#     @tmp.destroy if @tmp
#   end
#   cat.collection_id = nil
 #  cat.save
    if cat.id != @cat[0].id
    #@newcol=Collection.new(:collection=>0 , :cat1_id=>@cat[0].id , :k1c=>cat.k1c)
    @newcol=Collection.new( :cat1_id=>@cat[0].id , :k1c=>cat.k1c)
    @newcol.save
    end
  end
    Cart.delete_all(['User_id=?',@user.id])
   Cart.delete_all(['sesion_id=?',request.session_options[:id]])
   flash[:notice] = 'сопутствующие товары сохранены'
   redirect_to :back
  end

   def coll
     @per_page=10
    @coll=Collection.paginate :all , :conditions=>['collection=?',1], :order=>'created_at desc' ,:page => params[:page], :per_page =>@per_page
   end

 def one_coll
     @coll=Collection.find_by_id(params[:id])
 end


   def st

 
      @per_page=10
 
     @col=Collection.find :all , :conditions=>['cat1_id is not NULL'] , :select=>'distinct cat1_id' , :order=>'created_at'
     @st_1=[]
     for col in @col do
       @tmp=Cat1.find_by_id(col.cat1_id)
       @st_1<<@tmp if @tmp
     end
     #@st_1.sort!{|s1,s2| s1.tov3_id <=> s2.tov3_id}
     @st=@st_1.paginate :page => params[:page], :per_page =>@per_page
   end


  def edit_coll
  user
  @collection = Collection.find(params[:id])


@collection.cat1.each do |cat|
  @uprice=Nprice1.find_by_k1c(cat.k1c)
  @cart=Cart.new(:Sesion_id=>request.session_options[:id], :otdel=> "kanc" , :User_id=>@user.id, :k1s=> cat.k1c, :price=> @uprice.pp , :user1_id=>@user.id)
  @cart.save
  cat.collection_id = nil
  cat.save
end
@collection.destroy
redirect_to :controller=>'bas1' , :action=>'edit_cart'
 end


 def destroy_coll
    @collection = Collection.find(params[:id])
    for cat in @collection.cat1 do
      cat.collection_id = nil
      cat.save
    end
    @collection.destroy
    redirect_to :back
  end

 def del_elem_coll
   @cat=Cat1.find_by_id(params[:id])
   @cat.collection_id=nil
   @cat.save
   redirect_to :back
 end

   def edit_st
  user
    @cat = Cat1.find_by_id(params[:id])
    @uprice=Nprice1.find_by_k1c(@cat.k1c)
  @cart=Cart.new(:Sesion_id=>request.session_options[:id], :otdel=> "kanc" , :User_id=>@user.id, :k1s=> @cat.k1c, :price=> @uprice.pp , :user1_id=>@user.id)
  @cart.save
    for coll in @cat.collection do
  @uprice=Nprice1.find_by_k1c(coll.k1c)
  @cart=Cart.new(:Sesion_id=>request.session_options[:id], :otdel=> "kanc" , :User_id=>@user.id, :k1s=> coll.k1c, :price=> @uprice.pp , :user1_id=>@user.id)
  @cart.save
  coll.destroy
    end

redirect_to :controller=>'bas1' , :action=>'edit_cart'
 end

   def destroy_st
    @cat = Cat1.find_by_id(params[:id])
    for coll in @cat.collection do
      coll.destroy
    end
    redirect_to :back
  end

 def del_elem_st
   @coll=Collection.find_by_id(params[:id])
   @coll.destroy
   redirect_to :back
 end


end
