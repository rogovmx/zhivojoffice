class VictorinasController < ApplicationController
  layout 'search'
  
  def yes
    
  end
  def no
    user
    @p = VictUsersQ.count :conditions=>['user_id=? and vict_users_qs.right=?',@user.id ,1 ]
  end

  def user
    @user=User.find_by_id(session[:user_id])
  end

  def index
    user
    @pravo=VictorUsers.find :first ,:conditions=>["user_id=?",@user.id]
    @v_users = VictorUsers.find_all_by_win(1)

    
  end

  def save_vict_users
  user
  unless VictorUsers.find_by_user_id(@user.id)
    @victor_users = VictorUsers.new
    @victor_users.user_id = @user.id
    if @victor_users.user_id == 2019
    @victor_users.right = 777
    else
    @victor_users.right = Time.now.seconds_since_midnight
    end
    @victor_users.save
    redirect_to :action=>'start'
  else
    redirect_to :action=>'index'
  end
  end

  def start
    user
    @all_user_q = VictUsersQ.find( :all, :conditions=> ['user_id=? ',@user.id])
    if @all_user_q.size < 10
    @ost_q = ((1..15).to_a - @all_user_q.map{|m| m.id_question}.to_a).compact
    @rand = @ost_q[rand(@ost_q.size - 1)]
    @vv = Victorina.find(@rand)

    else
      redirect_to :action=>'index'
    end
  end

def save_vict_qs
   user
   @voprosov=VictUsersQ.count :conditions=>["user_id=?",@user.id]
   @prav_otv=VictUsersQ.count :conditions=>['user_id=? and vict_users_qs.right=?',@user.id ,1 ]
   @victor_users = VictorUsers.find_by_user_id(@user.id)
   if @voprosov < 10
        @vict_users_q = VictUsersQ.new(params[:vict_users_q])
        @victorina = Victorina.find(@vict_users_q.id_question)
        @vict_users_q.right = (@victorina.right_q == @vict_users_q.user_answ) ? 1 : 0
        @vict_users_q.save          
   end
  @voprosov=VictUsersQ.count :conditions=>["user_id=?",@user.id]
  @prav_otv=VictUsersQ.count :conditions=>['user_id=? and vict_users_qs.right=?',@user.id ,1 ]
   flash[:notice] = @voprosov.to_s
   
  if @voprosov < 10
    redirect_to :action=>'start'
  elsif @voprosov == 10
      if @prav_otv < 10
        @victor_users.win = 0
        @victor_users.save
      redirect_to :action=>'no' 
      elsif  @prav_otv == 10
        @victor_users.win = 1
        @victor_users.save
        order = @victor_users
         Mailer.deliver_viktorina(order , @user)
      redirect_to :action=>'yes'
      end
  else
      redirect_to :action=>'index'
  end
end



end
