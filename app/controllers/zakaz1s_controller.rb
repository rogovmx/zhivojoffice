class Zakaz1sController < ApplicationController
  # GET /zakaz1s
  # GET /zakaz1s.xml
  def index
    @zakaz1s = Zakaz1.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @zakaz1s }
    end
  end

  # GET /zakaz1s/1
  # GET /zakaz1s/1.xml
  def show
    @zakaz1 = Zakaz1.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @zakaz1 }
    end
  end

  # GET /zakaz1s/new
  # GET /zakaz1s/new.xml
  def new
    @zakaz1 = Zakaz1.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @zakaz1 }
    end
  end

  # GET /zakaz1s/1/edit
  def edit
    @zakaz1 = Zakaz1.find(params[:id])
  end

  # POST /zakaz1s
  # POST /zakaz1s.xml
  def create
    @zakaz1 = Zakaz1.new(params[:zakaz1])

    respond_to do |format|
      if @zakaz1.save
        format.html { redirect_to(@zakaz1, :notice => 'Zakaz1 was successfully created.') }
        format.xml  { render :xml => @zakaz1, :status => :created, :location => @zakaz1 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @zakaz1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /zakaz1s/1
  # PUT /zakaz1s/1.xml
  def update
    @zakaz1 = Zakaz1.find(params[:id])

    respond_to do |format|
      if @zakaz1.update_attributes(params[:zakaz1])
        format.html { redirect_to(@zakaz1, :notice => 'Zakaz1 was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @zakaz1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zakaz1s/1
  # DELETE /zakaz1s/1.xml
  def destroy
    @zakaz1 = Zakaz1.find(params[:id])
    @zakaz1.destroy

    respond_to do |format|
      format.html { redirect_to(zakaz1s_url) }
      format.xml  { head :ok }
    end
  end
end
