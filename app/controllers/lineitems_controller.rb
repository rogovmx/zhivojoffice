class LineitemsController < ApplicationController
  # GET /lineitems
  # GET /lineitems.xml
#  def index
#    @lineitems = Lineitem.find(:all)
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @lineitems }
#    end
#  end

  # GET /lineitems/1
  # GET /lineitems/1.xml
  def show
    @lineitem = Lineitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lineitem }
    end
  end

  # GET /lineitems/new
  # GET /lineitems/new.xml
  def new
    @lineitem = Lineitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lineitem }
    end
  end

  # GET /lineitems/1/edit
  def edit
    @lineitem = Lineitem.find(params[:id])
  end

  # POST /lineitems
  # POST /lineitems.xml
  def create
    @lineitem = Lineitem.new(params[:lineitem])

    respond_to do |format|
      if @lineitem.save
        flash[:notice] = 'Lineitem was successfully created.'
        format.html { redirect_to(@lineitem) }
        format.xml  { render :xml => @lineitem, :status => :created, :location => @lineitem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lineitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lineitems/1
  # PUT /lineitems/1.xml
  def update
    @lineitem = Lineitem.find(params[:id])

    respond_to do |format|
      if @lineitem.update_attributes(params[:lineitem])
        flash[:notice] = 'Lineitem was successfully updated.'
        format.html { redirect_to(@lineitem) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lineitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lineitems/1
  # DELETE /lineitems/1.xml
  def destroy
    @lineitem = Lineitem.find(params[:id])
    @lineitem.destroy

    respond_to do |format|
      format.html { redirect_to(lineitems_url) }
      format.xml  { head :ok }
    end
  end
end
