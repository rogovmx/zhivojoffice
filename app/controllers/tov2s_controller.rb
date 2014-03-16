class Tov2sController < ApplicationController
  # GET /tov2s
  # GET /tov2s.xml
  layout'search_nofoot'
   before_filter :authorize
   before_filter :redaktor


  def index
    @razdel1s = Razdel1.all
    if params[:first1_id]
      @first1 = [First1.find(params[:first1_id])]
      #@tov2s = @first1.tov2
    else
      @first1 = First1.find :all , :order => 'kod'
      #@tov2s =Tov2.find(:all,:order=>'ord')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tov2s }
    end
  end

  # GET /tov2s/1
  # GET /tov2s/1.xml
  def show
    @tov2 = Tov2.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tov2 }
    end
  end

  # GET /tov2s/new
  # GET /tov2s/new.xml
  def new
    @tov2 = Tov2.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tov2 }
    end
  end

  # GET /tov2s/1/edit
  def edit
    @tov2 = Tov2.find(params[:id])
  end

  # POST /tov2s
  # POST /tov2s.xml
  def create
    @tov2 = Tov2.new(params[:tov2])

    respond_to do |format|
      if @tov2.save
        flash[:notice] = 'Tov2 was successfully created.'
        #format.html { redirect_to(@tov2) }
        format.html { 
          redirect_to :controller=>'tov2s',:first_id=>@tov2.first1_id
        }
        format.xml  { render :xml => @tov2, :status => :created, :location => @tov2 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tov2.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tov2s/1
  # PUT /tov2s/1.xml
  def update
    @tov2 = Tov2.find(params[:id])

    respond_to do |format|
      if @tov2.update_attributes(params[:tov2])
        flash[:notice] = 'Tov2 was successfully updated.'
       # format.html { redirect_to(@tov2) }
       format.html { redirect_to :controller=>'tov2s',:first_id=>@tov2.first1_id }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tov2.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tov2s/1
  # DELETE /tov2s/1.xml
  def destroy
    @tov2 = Tov2.find(params[:id])
    @tov2.destroy

    respond_to do |format|
      #format.html { redirect_to(tov2s_url) }
        format.html { redirect_to :controller=>'tov2s',:first_id=>@tov2.first1_id }
      format.xml  { head :ok }
    end
  end
end
