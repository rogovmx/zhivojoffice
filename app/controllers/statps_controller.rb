class StatpsController < ApplicationController
  # GET /statps
  # GET /statps.xml
  layout 'search_nofoot'
   before_filter :authorize
   before_filter :redaktor

  def index
    @statps = Statp.find(:all , :order => 'title' )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @statps }
    end
  end

  # GET /statps/1
  # GET /statps/1.xml
  def show
 redirect_to :action=>'index'
  end

  # GET /statps/new
  # GET /statps/new.xml
  def new
    @statp = Statp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @statp }
    end
  end

  # GET /statps/1/edit
  def edit
    @statp = Statp.find(params[:id])
  end

  # POST /statps
  # POST /statps.xml
  def create
    @statp = Statp.new(params[:statp])

    respond_to do |format|
      if @statp.save
        flash[:notice] = 'Statp was successfully created.'
        format.html { redirect_to(@statp) }
        format.xml  { render :xml => @statp, :status => :created, :location => @statp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @statp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statps/1
  # PUT /statps/1.xml
  def update
    @statp = Statp.find(params[:id])

    respond_to do |format|
      if @statp.update_attributes(params[:statp])
        flash[:notice] = 'Statp was successfully updated.'
        format.html { redirect_to(:action=>'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @statp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statps/1
  # DELETE /statps/1.xml
  def destroy
    @statp = Statp.find(params[:id])
    @statp.destroy

    respond_to do |format|
      format.html { redirect_to(:action=>'index') }
      format.xml  { head :ok }
    end
  end
end
