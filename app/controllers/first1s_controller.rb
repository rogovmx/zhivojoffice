class First1sController < ApplicationController
  # GET /first1s
  # GET /first1s.xml
  layout 'search_nofoot'
   before_filter :authorize
   before_filter :redaktor
  def index
    @razdel1s = Razdel1.find(:all)
    if params[:razdel1_id]
      @razdel1 = [Razdel1.find(params[:razdel1_id])]
      #@first1s = [@razdel1.first1s]

    else
      @razdel1 = @razdel1s
      #@first1s = First1.find :all , :order => 'kod'
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @first1s }
    end
  end

  # GET /first1s/1
  # GET /first1s/1.xml
  def show
    @first1 = First1.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @first1 }
    end
  end

  # GET /first1s/new
  # GET /first1s/new.xml
  def new
    @first1 = First1.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @first1 }
    end
  end

  # GET /first1s/1/edit
  def edit
    @first1 = First1.find(params[:id])
  end

  # POST /first1s
  # POST /first1s.xml
  def create
    @first1 = First1.new(params[:first1])

    respond_to do |format|
      if @first1.save
        flash[:notice] = 'First1 was successfully created.'
        format.html { redirect_to(@first1) }
        format.xml  { render :xml => @first1, :status => :created, :location => @first1 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @first1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /first1s/1
  # PUT /first1s/1.xml
  def update
    @first1 = First1.find(params[:id])

    respond_to do |format|
      if @first1.update_attributes(params[:first1])
        flash[:notice] = 'First1 was successfully updated.'
        format.html { redirect_to(@first1) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @first1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /first1s/1
  # DELETE /first1s/1.xml
  def destroy
    @first1 = First1.find(params[:id])
    @first1.destroy

    respond_to do |format|
      format.html { redirect_to(first1s_url) }
      format.xml  { head :ok }
    end
  end
end
