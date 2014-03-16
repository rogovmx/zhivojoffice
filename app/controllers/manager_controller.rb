class ManagerController < ApplicationController
 layout 'search'
  before_filter :authorize
  before_filter :manager

  def index
  
  user_m
   # @clients=Client.find :all,:conditions=>["manager=?",@manager.id]
    @clients=@manager.client
  end
  def user_m
     @user=User.find_by_id(session[:user_id])
     @manager=Manager1.find :first, :conditions=>["user_id=?",@user.id]
  end
   def client
     @client=Client.find(params[:id])

     render(:partial => 'manager',:object=>@client)
     
   end
   def t1
     @client=Client.find(params[:id])
     #@legals=Legal.find :all, :conditions=>["client_id=?",@cliemt.id]
     render(:partial => 't1',:object=>@client)
   end
   def t2
     @client=Client.find(params[:id])
     
     render(:partial => 't2')
   end
   def t3
      @client=Client.find(params[:id])
      @orders=Order.find :all, :conditions=>["client_id=?",@client.id]
     
     render(:partial => 't3')
   end

   def t4
     @client=Client.find(params[:id])

     render(:partial => 't4')
   end
   def t5
     @client=Client.find(params[:id])

     render(:partial => 't5')
   end

   def t6
     @client=Client.find(params[:id])
     @bonus=Bonus1.find:first, :conditions=>["k1c=?",@client.k1c]
   end


    def edit_legals
      @legal=Legal.find(params[:id])
       render(:partial => 'edit_legal',:object=>@legal)
    end


    def update_price
   @user=User.find(params[:user_id])
   @user.price1=params[:price]
   @user.save
   render(:partial =>'price',:object=>@user)

    end
end
