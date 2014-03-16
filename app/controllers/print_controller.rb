class PrintController < ApplicationController
  def user
    @user=User.find_by_id(session[:user_id])
   end

   def cart

     if @user
     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     @cart_count=Cart.count :conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     else
       @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
        @cart_count=Cart.count :conditions=>['sesion_id=?',request.session_options[:id]]
     end
     @cart_sum=0
     @cart.each do |cart|
       @cart_sum+=cart.price*cart.quantity if cart.price
     end
     end
  
  def zakaz
     user
     cart
  end


  def oldzakaz
     user
     @order = Order.find(params[:id])

     @cart = @order.lineitem
     @cart_sum = @cart.inject(0){ |r,el| r+=el.quantity * el.price}
  end

end
