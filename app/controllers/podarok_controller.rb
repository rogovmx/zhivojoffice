class PodarokController < ApplicationController
layout 'podarok'
     require "will_paginate"


  def user
    @user=User.find_by_id(session[:user_id])
  end

 def cart
     user
     if @user
     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     @cart_count=Cart.count :conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     else
        @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
        @cart_count=Cart.count :conditions=>['sesion_id=?',request.session_options[:id]]
     end
     @cart_sum= 0

     @cart.each do |cart|
       @cart_sum += cart.price*cart.quantity if cart.price
     end

     end
def  per_page

    @per_page=session[:per_page]
    if @per_page==nil
      @per_page=12
    end
    return @per_page
  end



  def index
    redirect_to '/'
#     session[:original_uri]=request.request_uri
#     user
#     cart
#
#     if params[:sign] != nil
#     session[:sign]=params[:sign]
#     sign=params[:sign]
#     elsif params[:sign] == nil
#     sign = session[:sign]
#     end
#
#     if params[:price] != nil
#     session[:price]= params[:price]
#     price=params[:price]
#     elsif params[:price] == nil
#     price = session[:price]
#     end
#
#    if params[:clear] == '1'
#     price = nil
#     sign = nil
#     session[:price]= nil
#     session[:sign]= nil
#    end
#    @s = sign
#    @p = price
#     @per_page=session[:per_page]
#    if @per_page==nil
#      @per_page=12
#    end
#
#     @sign = Cat1.find_by_sql(["select distinct sign from cat1s where (sign is not null) and podarok = 1 and not(sign='')"])
#
#
#
#    if sign == nil and price == nil #----------------------------
#
#          if (@user and  @user.role) != 'redaktor'
#            @tg=Cat1.paginate :conditions=>['vis=? and podarok=?',1,1], :page => params[:page], :per_page =>@per_page,:order=>'updated_at desc' ,:group=>'tov3_id'
#          else
#            @tg=Cat1.paginate :conditions=>['podarok=?',1], :page => params[:page], :per_page =>@per_page, :order=>'updated_at desc' ,:group=>'tov3_id'
#          end
#
#    elsif sign != nil and price == nil #----------------------------
#      if (@user and  @user.role) != 'redaktor'
#            @tg=Cat1.paginate :conditions=>['vis=? and podarok=? and sign=?',1,1, sign], :page => params[:page], :per_page =>@per_page,:group=>'tg'
#          else
#            @tg=Cat1.paginate :conditions=>['podarok=? and sign=?',1, sign], :page => params[:page], :per_page =>@per_page,:group=>'tg'
#          end
#
#    elsif sign == nil and price != nil #----------------------------
#       if price == '1'
#
#        if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and k1c in (select k1c from nprice1s where pp > 500 and pp < 1000)"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#         else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and k1c in (select k1c from nprice1s where pp > 500 and pp < 1000)"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#      elsif  price == '0'
#        if (@user and  @user.role) != 'redaktor'
#        @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and k1c in (select k1c from nprice1s where pp < 500)"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#       else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and k1c in (select k1c from nprice1s where pp < 500)"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#       end
#      elsif  price == '2'
#          if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and k1c in (select k1c from nprice1s where pp >= 1000 and pp < 2000)"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#         else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and k1c in (select k1c from nprice1s where pp >= 1000 and pp < 2000)"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#      elsif  price == '3'
#          if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and k1c in (select k1c from nprice1s where pp >= 2000 and pp < 4000)"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#         else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and k1c in (select k1c from nprice1s where pp >= 2000 and pp < 4000)"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#      elsif  price == '4'
#          if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and k1c in (select k1c from nprice1s where pp >= 4000"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#         else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and k1c in (select k1c from nprice1s where pp >= 4000"], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#      elsif  price == '5'
#          if (@user and  @user.role) != 'redaktor'
#            @tg=Cat1.paginate :conditions=>['vis=? and podarok=? and sign=?',1,1, sign], :page => params[:page], :per_page =>@per_page,:order=>'updated_at desc' ,:group=>'tov3_id'
#          else
#            @tg=Cat1.paginate :conditions=>['podarok=? and sign=?',1, sign], :page => params[:page], :per_page =>@per_page,:order=>'updated_at desc' ,:group=>'tov3_id'
#          end
#        end
#
#    elsif sign != nil and price != nil #----------------------------
#     if price == '1'
#          if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp > 500 and pp < 1000)", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp > 500 and pp < 1000)", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#    elsif  price == '0'
#        if (@user and  @user.role) != 'redaktor'
#        @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp < 500 )", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp < 500 )", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#       end
#
#
#     elsif  price == '2'
#           if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp >= 1000 and pp < 2000)", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp >= 1000 and pp < 2000)", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#     elsif  price == '3'
#          if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp >= 2000 and pp < 4000)", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp >= 2000 and pp < 4000)", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#     elsif  price == '4'
#         if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp >= 4000)", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and sign=? and k1c in (select k1c from nprice1s where pp >= 4000)", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#     elsif  price == '5'
#          if (@user and  @user.role) != 'redaktor'
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where vis=1 and podarok=1 and sign=?", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          else
#          @tg = Cat1.paginate_by_sql(["select * from cat1s where podarok=1 and sign=?", sign], :page => params[:page], :per_page =>@per_page,:group=>'tg')
#          end
#     end
#
#    end
#

  end

def tov
  redirect_to '/'
#    user
#    cart
#    if params[:id]== '5277' or params[:id]== '5276' or params[:id]== '5278' or params[:id]== '5279'
#      redirect_to :controller=>'act'
#    end
#     @sign = Cat1.find_by_sql(["select distinct sign from cat1s where (sign is not null) and podarok = 1 and not(sign='')"])
#    @cat=Cat1.find(params[:id])

  end

def del_tov
    Cat1.destroy(params[:id])
  end

def edit_tov
       @cat1=Cat1.find(params[:id])
      render(:partial =>'/part/edit_tov',:object=>@cat1)
   end
def save_new_podarok
     @p = Podarok.new(params[:podarok])
     @p.save
  
end

def out
  session[:sign]=nil
  session[:price]=nil
  redirect_to '/'
end

def save_podarok
 
if params[:podarok.id] != nil
  @p = Podarok.find_by_id(params[:podarok.id])
  @p = params[:podarok]
  @p.save
else
  @p = Podarok.new(params[:podarok])
  @p.save
end
render :text=>:podarok.id
  #redirect_to :back
end


end
