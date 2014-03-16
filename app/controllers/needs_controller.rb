class NeedsController < ApplicationController
  layout 'vvk'
  # GET /needs
  # GET /needs.xml
  def index
   @user=User.find_by_id(session[:user_id])
      @needs = Need.find(:all)
     @need = Need.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @needs }
    end
  end

  # GET /needs/1
  # GET /needs/1.xml

   def show
  redirect_to :action=>'index'
  end

  # POST /collections
  # POST /collections.xml
  def create
    @need = Need.new(params[:need])

    respond_to do |format|
      if @need.save
        flash[:notice] = 'Ваш запрос отправлен'
        Mailer.deliver_needs(@need)
        format.html { redirect_to :action=>'index' }
         else
        format.html { render :action => "new" }

      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.xml
  
 
end
