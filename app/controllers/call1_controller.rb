class Call1Controller < ApplicationController
  layout 'search_nofoot'
   before_filter :authorize
   before_filter :admin_call
   require 'will_paginate'
 def user
     @user=User.find_by_id(session[:user_id])
 end

 def users
   user

   if request.post?
     if params[:fuser]
       @search = params[:fuser]
       if @user.city == 'Смоленск'
       @users = User.find :all , :conditions => ['city = ?', 'Смоленск']  if @user.city == 'Смоленск'
       else
       @users = User.find :all , :conditions=>[ 'role = ? or role = ?', 'user', 'poduser' ]
       end
       
       @user_join=@users.map{|x| [x.id , [x[:name], x[:scr_name], x[:surename], x[:phone], x[:company_ind], x[:mail], x[:inn]].join(' ')]}
       @find=@user_join.map{|x| x[0] if x[1].strip.downcase.index(@search.downcase)}.compact
       @fusers = @users.find_all{|x| x if @find.include?(x.id)}
     elsif params[:client]
       @search = params[:client]
       @clients = Client.all
       @client_join=@clients.map{|x| [x.id , [x[:k1c], x[:name], x[:inn], x[:kpp]].join(' ')]}
       @find=@client_join.map{|x| x[0] if x[1].strip.downcase.index(@search.downcase)}.compact
       @fclients = @clients.find_all{|x| x if @find.include?(x.id)}

     end
   end
   
 end



  def index
    user
    if @user.city == 'Смоленск'
    @new_user=User.paginate :all,:conditions=>["client1_id=? and role = ? and city = ?",0,'user','Смоленск'] ,:order=>'created_at desc' , :page=>params[:page] , :per_page=>30
    else
    if session[:city]=='msk' or session[:city]=='nn'
    @new_user=User.paginate :all,:conditions=>["client1_id=? and role = ? and city=?",0,'user','Москва'],:order=>'created_at desc' , :page=>params[:page] , :per_page=>30
    else
    @new_user=User.paginate :all,:conditions=>["client1_id=?  and role = ? and city !=? and city !=? and city !=?",0,'user','Москва','Нижний Новгород','Смоленск'],:order=>'created_at desc' , :page=>params[:page] , :per_page=>30
    end
    end
  end

  def edit_user
     @user = User.find(params[:id])
  end

  def edit_client
    @client = Client.find(params[:id])
    @users = @client.user
  end


  def edit_user2
     @user = User.find(params[:id])
     @client = @user.client
     @client_mb=Client.find :first ,:conditions=>["inn=?",@user.inn] unless @client
  end

 def upd_user
  @user=User3.find_by_id(params[:id])
  if @user.update_attributes(params[:user11])
  else
  end

    flash[:notice] = 'Пользователь сохранен'
    redirect_to :action=>'index' ,:page=>params[:page]
 end

  def upd_user2
  @user=User3.find_by_id(params[:id])
  if @user.update_attributes(params[:user11])
  else
  end

    flash[:notice] = 'Пользователь сохранен'
    redirect_to :back
 end


  def upd_client
  @client=Client.find_by_id(params[:id])
  if @client.update_attributes(params[:client])
  else
  end
    flash[:notice] = 'Клиент сохранен'
    redirect_to :back
 end




  def new_client

    @new_user=User3.find(params[:id])
    @client=Client.find(params[:client])
    @new_user.client1_id=@client.id
    @new_user.client_id=@client.id
    @new_user.save!
    #render :text=>@new_user.client_id.to_s
    redirect_to :action=>'index'

    #@vid=Vd.find(:all).map{|u| [u.Name,u.id]}

  end

  def del_user
    user=User.find(params[:id])
    user.destroy

    redirect_to :back
  end


   def ncc
     @user=User.find(params[:id])
   end

  def  new_client_cart
        @client = Client.new(params[:client])
        @client.save
        @user=User3.find(params[:user])
        @user.client_id=@client.id
        @user.client1_id=@client.id
        @user.save
        redirect_to :action=>'index'
  end



end
