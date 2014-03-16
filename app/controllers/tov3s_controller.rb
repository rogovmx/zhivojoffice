class Tov3sController < ApplicationController
  # GET /tov3s
  # GET /tov3s.xml
  layout'search_nofoot'
   before_filter :authorize
   before_filter :redaktor
  def index
    @tov2s = Tov2.find(:all)
    if params[:tov2_id]
      @tov2 = Tov2.find(params[:tov2_id])
    else
      @tov2 = Tov2.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tov3s }
    end
  end

  # GET /tov3s/1
  # GET /tov3s/1.xml
  def show
    @tov3 = Tov3.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tov3 }
    end
  end

  # GET /tov3s/new
  # GET /tov3s/new.xml
  def new
    @tov3 = Tov3.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tov3 }
    end
  end

  # GET /tov3s/1/edit
  def edit
    @tov3 = Tov3.find(params[:id])
  end

  # POST /tov3s
  # POST /tov3s.xml
  def create
    @tov3 = Tov3.new(params[:tov3])

    respond_to do |format|
      if @tov3.save
        flash[:notice] = 'Tov3 was successfully created.'
       # format.html { redirect_to(@tov3) }
        format.html { redirect_to :controller=>'tov3s',:tov2_id=>@tov3.tov2_id }
        format.xml  { render :xml => @tov3, :status => :created, :location => @tov3 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tov3.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tov3s/1
  # PUT /tov3s/1.xml
  def update
    @tov3 = Tov3.find(params[:id])

    respond_to do |format|
      if @tov3.update_attributes(params[:tov3])
        flash[:notice] = 'Tov3 was successfully updated.'
        #format.html { redirect_to(@tov3) }
         format.html { redirect_to :controller=>'tov3s',:tov2_id=>@tov3.tov2_id }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tov3.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tov3s/1
  # DELETE /tov3s/1.xml
  def destroy
    @tov3 = Tov3.find(params[:id])
    @tov3.destroy

    respond_to do |format|
      #format.html { redirect_to(tov3s_url) }
       format.html { redirect_to :controller=>'tov3s',:tov2_id=>@tov3.tov2_id }
      format.xml  { head :ok }
    end
  end
end
