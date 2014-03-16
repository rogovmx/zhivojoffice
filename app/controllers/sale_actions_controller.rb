class SaleActionsController < ApplicationController
  before_filter :authorize
  before_filter :redaktor
  layout 'search_nofoot'
  def index
    @sale_actions = SaleAction.find :all
    @cities = City.find :all

    session[:city_act] =  params[:city_id] ? params[:city_id] : (  session[:city_act] ? session[:city_act] : 1  )

    @city_now = City.find(session[:city_act])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sale_actions }
    end
  end

  def new
    @sale_action = SaleAction.new
    @cities = City.find :all
    @sale_action_max_pos = (SaleAction.find(:all , :conditions=>['city_id = ?' , session[:city_act]]).map(&:position)).max + 1

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale_action }
    end
  end

  def create
    @sale_action = SaleAction.new(params[:sale_action])

    if params[:sale_action][:image]
    name =  params[:sale_action][:image].original_filename 
    directory = 'public/images/sale_actions'
    path = File.join(directory, name)

    if params[:sale_action][:image].instance_of?(Tempfile)
      FileUtils.cp(params[:sale_action][:image].local_path, path)
    else
      File.open(path, "wb") { |f| f.write(params[:sale_action][:image].read) } 
    end
    @sale_action.image = name
    end

      
        flash[:notice] = 'Сохранено.' if @sale_action.save
        redirect_to sale_actions_path(:city_id => session[:city_act])
    

  end

  def edit
    @sale_action = SaleAction.find(params[:id])
    @cities = City.find :all
  end

  def update
    @sale_action = SaleAction.find(params[:id])
    name =  params[:sale_action][:image].original_filename if params[:sale_action][:image]
    directory = 'public/images/sale_actions'

    path = File.join(directory, name) if params[:sale_action][:image]

    if params[:sale_action][:image].instance_of?(Tempfile)
      FileUtils.cp(params[:sale_action][:image].local_path, path)
    else
      File.open(path, "wb") { |f| f.write(params[:sale_action][:image].read) } if params[:sale_action][:image]
    end

    respond_to do |format|
      if @sale_action.update_attributes(params[:sale_action])
        @sale_action.image = name if params[:sale_action][:image]
        @sale_action.save
        flash[:notice] = 'Сохранено.'
        format.html { redirect_to sale_actions_path(:city_id => session[:city_act])}
      end
    end
  end

  def destroy
    @sale_action = SaleAction.find(params[:id])
    @sale_action.destroy

    respond_to do |format|
      format.html { redirect_to sale_actions_path(:city_id => session[:city_act]) }
      format.xml  { head :ok }
    end
  end
end