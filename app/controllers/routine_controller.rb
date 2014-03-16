class RoutineController < ApplicationController
  layout 'bas1'

  def user
    @user=User.find_by_id(session[:user_id])
  end

   def cart
     user
     if @user
     @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
     else
     @cart=Cart.find :all,:conditions=>[' sesion_id=?',request.session_options[:id]]
     end
     @cart_count = @cart.size
     @cart_sum= @cart.inject(0){|r ,e| r + e.quantity * e.price}

  end

  def index
    render :layout => 'routina'
  end

  def rootina

  end


  def goods
  user
  cart
  @tg = []
  @fg = "k1c = '" + Funnygood.all.map{|m| m.k1c}.join("' or k1c = '")+"'"

    @tg = Cat1.find :all , :conditions=>["(#{@fg}) and vis = 1"]



  #render :text=>@fg

  render :layout => 'vvk'
  end

  def guide
    render :layout => 'routina'
  end

  def entertainment
    
  end

  def entertainment2

  end


  def case

  end

  def more
  end


end
