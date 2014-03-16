class OprosController < ApplicationController
  def user
    @user=User.find_by_id(session[:user_id])
   end

  
  def index
    user
    @questions = Question.find(:all)


  end
 def q_answ
  user
  @q_answ = Questionansw.new(params[:q_answ])
  @q_answ.save
  redirect_to :action=>'thanks'
 end

 def thanks
   render :text=>'Всем спасибо!'
 end

end
