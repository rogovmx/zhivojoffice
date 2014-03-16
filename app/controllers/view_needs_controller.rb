class ViewNeedsController < ApplicationController
     before_filter :authorize
   before_filter :redaktor
  
  layout 'vvk_fw'

  def index
    @user=User.find_by_id(session[:user_id])
    @needs = Need.find(:all)
  end

end
