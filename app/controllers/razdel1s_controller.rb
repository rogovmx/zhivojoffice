class Razdel1sController < ApplicationController
  # GET /razdel1s
  # GET /razdel1s.xml
  layout 'search_nofoot'
   before_filter :authorize
   before_filter :redaktor
  def index
    @razdel1s = Razdel1.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @razdel1s }
    end
  end

  # GET /razdel1s/1
  # GET /razdel1s/1.xml
  def show
    @razdel1 = Razdel1.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @razdel1 }
    end
  end

  # GET /razdel1s/new
  # GET /razdel1s/new.xml
  def new
    @razdel1 = Razdel1.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @razdel1 }
    end
  end

  # GET /razdel1s/1/edit
  def edit
    @razdel1 = Razdel1.find(params[:id])
  end

  # POST /razdel1s
  # POST /razdel1s.xml
  def create
    @razdel1 = Razdel1.new(params[:razdel1])

    respond_to do |format|
      if @razdel1.save
        flash[:notice] = 'razdel1 was successfully created.'
        format.html { redirect_to(@razdel1) }
        format.xml  { render :xml => @razdel1, :status => :created, :location => @razdel1 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @razdel1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /razdel1s/1
  # PUT /razdel1s/1.xml
  def update
    @razdel1 = Razdel1.find(params[:id])

    respond_to do |format|
      if @razdel1.update_attributes(params[:razdel1])
        flash[:notice] = 'razdel1 was successfully updated.'
        format.html { redirect_to(@razdel1) }
        format.xml  { head :ok } 
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @razdel1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /razdel1s/1
  # DELETE /razdel1s/1.xml
  def destroy
    @razdel1 = Razdel1.find(params[:id])
    @razdel1.destroy

    respond_to do |format|
      format.html { redirect_to(razdel1s_url) }
      format.xml  { head :ok }
    end
  end
end