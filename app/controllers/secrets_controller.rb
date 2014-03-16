class SecretsController < ApplicationController
  # GET /secrets
  # GET /secrets.xml
 layout 'search'
 before_filter :redaktor , :except=>['index','create']
 

  def index
    user
    @secret = Secret.new
    if redaktor?
    @secrets = Secret.all
    else
    @secrets = Secret.find :all , :conditions=>['vis = ?', 1]
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @secrets }
    end
  end


  def edit
   
    @secret = Secret.find(params[:id])
  end


  def create

    @secret = Secret.new(params[:secret])

    respond_to do |format|
      if @secret.save
        format.html { redirect_to(:action => 'index') }
        Mailer.deliver_secret(@secret)
        flash[:notice] = 'Сообщение отправлено'

      else
        format.html { render :action => "index" }

      end
    end
  end

  # PUT /secrets/1
  # PUT /secrets/1.xml
  def update
    @secret = Secret.find(params[:id])

    respond_to do |format|
      if @secret.update_attributes(params[:secret])
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @secret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /secrets/1
  # DELETE /secrets/1.xml
  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy

    respond_to do |format|
      format.html { redirect_to(:action => 'index') }
      format.xml  { head :ok }
    end
  end
end
