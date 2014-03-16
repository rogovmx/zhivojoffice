class PerpageController < ApplicationController
  def index
    session[:per_page] = params[:per_page]
    uri=session[:original_uri]
    redirect_to(uri || {:controller=>'kt1'})
  end

end
