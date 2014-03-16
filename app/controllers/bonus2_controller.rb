class Bonus2Controller < ApplicationController
#require "will_paginate"


  def index
    session[:original_uri]=request.request_uri
    @per_page=20
    user
    if @user
      if @user.city=='Москва' or @user.city=='Нижний Новгород'
        #@bonus=Cat1.paginate :all, :conditions=>['tg=? and msk=? ','БОНУСЫ',1] ,:page => params[:page],:per_page => @per_page,:order=>'price'
        @bonus=Cat1.find :all, :conditions=>['tg=? and msk=? ','БОНУСЫ',1]
      else
        #@bonus=Cat1.paginate :all, :conditions=>['tg=? and spb=?','БОНУСЫ',1] ,:page => params[:page],:per_page => @per_page,:order=>'price'
        @bonus=Cat1.find :all, :conditions=>['tg=? and spb=?','БОНУСЫ',1]
      end

    else
      if session[:city]=='msk' or session[:city]=='nn'
        #@bonus=Cat1.paginate :all, :conditions=>['tg=? and msk=?','БОНУСЫ',1] ,:page => params[:page],:per_page => @per_page,:order=>'price'
        @bonus=Cat1.find :all, :conditions=>['tg=? and msk=?','БОНУСЫ',1]
      else
        #@bonus=Cat1.paginate :all, :conditions=>['tg=? and spb=?','БОНУСЫ',1] ,:page => params[:page],:per_page => @per_page,:order=>'price'
        @bonus=Cat1.find :all, :conditions=>['tg=? and spb=?','БОНУСЫ',1]
      end
    end

   

    if @user
      @summ=Bcart1.sum(:bonus_price,:conditions=> ["user_id=?",@user.id])
      @count1=Bcart1.count(:conditions=> ["user_id=?",@user.id])
      @client=Client.find :first ,:conditions=>["id=?",@user.client1_id]

      if @user.city == 'Смоленск'
        @bonus_many=Bonus1smol.find :first, :conditions=>["k1c=?",@client.k1c]
      else
        @bonus_many=Bonus1.find :first, :conditions=>["k1c=?",@client.k1c]
      end if @client

      if @bonus_many
        @limit=@bonus_many.ost-@summ
        @count=3-@count1
      else
        @limit=0
        @count=0
      end
    end
  end

  def bonus_tov
    user
   if @user
     @summ=Bcart1.sum(:bonus_price,:conditions=> ["user_id=?",@user.id])
     @count1=Bcart1.count(:conditions=> ["user_id=?",@user.id])
     @client=Client.find :first ,:conditions=>["id=?",@user.client1_id]

      if @client
        if @user.city == 'Смоленск'
          @bonus_many=Bonus1smol.find :first, :conditions=>["k1c=?",@client.k1c]
        else
          @bonus_many=Bonus1.find :first, :conditions=>["k1c=?",@client.k1c]
        end
      end

      if @bonus_many
        @limit=@bonus_many.ost-@summ
        @count=3-@count1
      else
        @limit=0
        @count=0
      end
    end
    @bonus=Bonus3.find(params[:id])

  end


  def rule
   user
   if @user
     @summ=Bcart1.sum(:bonus_price,:conditions=> ["user_id=?",@user.id])
     @count1=Bcart1.count(:conditions=> ["user_id=?",@user.id])
     @client=Client.find :first ,:conditions=>["id=?",@user.client1_id]

      if @client
        if @user.city == 'Смоленск'
          @bonus_many=Bonus1smol.find :first, :conditions=>["k1c=?",@client.k1c]
        else
          @bonus_many=Bonus1.find :first, :conditions=>["k1c=?",@client.k1c]
        end
      end
      if @bonus_many
        @limit=@bonus_many.ost-@summ
        @count=3-@count1
      else
        @limit=0
        @count=0
      end
    end
  end

  def create_bonus_cart
    @cat=Cat1.find :first , :conditions=>['k1c=?',params[:k1c]]
    @user=User.find_by_id(session[:user_id])
    @summ=Bcart1.sum(:bonus_price,:conditions=> ["user_id=?",@user.id])
    @count1=Bcart1.count(:conditions=> ["user_id=?",@user.id])
    @limit=0-@summ
    @count=3-@count1
    @cart=Bcart1.new
    @cart.user_id=@user.id
    @cart.k1c=params[:k1c]
    @b_pr=Nprice1.find_by_k1c(@cat.k1c)
    @cart.bonus_price=@b_pr.bonus
    @cart.save
    flash[:notice] = 'Бонус в корзине.'
    redirect_to :back
  end


  def editcart
    user
    if @user
     @summ=Bcart1.sum(:bonus_price,:conditions=> ["user_id=?",@user.id])
     @count1=Bcart1.count(:conditions=> ["user_id=?",@user.id])
     @client=Client.find :first ,:conditions=>["id=?",@user.client1_id]
       if @client
        if @user.city == 'Смоленск'
          @bonus_many=Bonus1smol.find :first, :conditions=>["k1c=?",@client.k1c]
        else
          @bonus_many=Bonus1.find :first, :conditions=>["k1c=?",@client.k1c]
        end
       end
      
      if @bonus_many
        @limit=@bonus_many.ost-@summ
        @count=3-@count1
      else
       @limit=0
       @count=0
      end
    end
 
     @cart=Bcart1.find(:all ,:conditions=> ["user_id=?",@user.id])

  end

  def del_bon
    user
     Bcart1.delete(params[:id])
     redirect_to :controller=>'bonus2',:action=>'editcart'
  end

  def delcart
    user
    Bcart1.delete_all(['user_id=?',@user.id])
    redirect_to :controller=>'bonus2'
  end

  def  send_bonus
   user
   @client=Client.find :first ,:conditions=>["id=?",@user.client_id]
   @order=Bcart1.find(:all ,:conditions=> ["user_id=?",@user.id])

   Mailer.deliver_zbonus(@order , @user)
   for order in @order do
     @border=Border.new
     @border.user_id = order.user_id
     @border.k1c = order.k1c
     @border.bonus_price = order.bonus_price
     @border.save
   end

      if @client
        if @user.city == 'Смоленск'
          @bonus_many=Bonus1smol.find :first, :conditions=>["k1c=?",@client.k1c]
        else
          @bonus_many=Bonus1.find :first, :conditions=>["k1c=?",@client.k1c]
        end
      end
   summ=Bcart1.sum(:bonus_price,:conditions=> ["user_id=?",@user.id])
   ost=@bonus_many.ost
   @bonus_many.ost=ost - summ
   @bonus_many.save
   Bcart1.delete_all(['user_id=?',@user.id])
   flash[:notice] = 'Бонусы заказаны'
   redirect_to :action=>'index'
  end

end
