class ActionitemsController < ApplicationController
  before_filter :authorize
  before_filter :redaktor
  layout 'search_nofoot'
  # GET /actionitems
  # GET /actionitems.xml
  def index
    @action_items = Actionitem.find :all
    @actions = Action.find :all

    session[:current_action] =  params[:action_id] || 1  

    @action_now = Action.find(session[:current_action])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @actionitems }
    end
  end

  # GET /actionitems/1
  # GET /actionitems/1.xml
  def show
    @actionitem = Actionitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @actionitem }
    end
  end

  # GET /actionitems/new
  # GET /actionitems/new.xml
  def new
    @actionitem = Actionitem.new
    @actionitems_max_sort = Actionitem.find(:all , :conditions => { :action_id => params[:action_id] }).map(&:sort).max + 1
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @actionitem }
    end
  end

  # GET /actionitems/1/edit
  def edit
    @actionitem = Actionitem.find(params[:id])
  end

  # POST /actionitems
  # POST /actionitems.xml
  def create
    @actionitem = Actionitem.new(params[:actionitem])
    name =  params[:actionitem][:pic].original_filename if params[:actionitem][:pic]
    directory = 'public/images/action_items_images'

    path = File.join(directory, name) if params[:actionitem][:pic]

    if params[:actionitem][:pic].instance_of?(Tempfile)
      FileUtils.cp(params[:actionitem][:pic].local_path, path)
    else
      File.open(path, "wb") { |f| f.write(params[:actionitem][:pic].read) } if params[:actionitem][:pic]
    end

    respond_to do |format|
      if @actionitem.save
        @actionitem.pic = name if params[:actionitem][:pic]
        @actionitem.save
        format.html { redirect_to(actionitems_path(:action_id => @actionitem.action_id), :notice => 'Акция была успешно добавлена.') }
        format.xml  { render :xml => @actionitem, :status => :created, :location => @actionitem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @actionitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /actionitems/1
  # PUT /actionitems/1.xml
  def update
    @actionitem = Actionitem.find(params[:id])
    name =  params[:actionitem][:pic].original_filename if params[:actionitem][:pic]
    directory = 'public/images/action_items_images'

    path = File.join(directory, name) if params[:actionitem][:pic]

    if params[:actionitem][:pic].instance_of?(Tempfile)
      FileUtils.cp(params[:actionitem][:pic].local_path, path)
    else
      File.open(path, "wb") { |f| f.write(params[:actionitem][:pic].read) } if params[:actionitem][:pic]
    end

    respond_to do |format|
      if @actionitem.update_attributes(params[:actionitem])
        @actionitem.pic = name if params[:actionitem][:pic]
        @actionitem.save
        format.html { redirect_to(actionitems_path(:action_id => @actionitem.action_id), :notice => 'Акция была успешно обновлена.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @actionitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /actionitems/1
  # DELETE /actionitems/1.xml
  def destroy
    @actionitem = Actionitem.find(params[:id])
    @actionitem.destroy

    respond_to do |format|
      format.html { redirect_to(actionitems_url) }
      format.xml  { head :ok }
    end
  end
end
