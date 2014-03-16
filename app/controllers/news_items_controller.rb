class NewsItemsController < ApplicationController
  before_filter :authorize
  before_filter :redaktor
  layout 'search_nofoot'
  def index
    @news_items = NewsItem.find :all, :order => "created_at desc"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_items }
    end
  end

  def new
    @news_item = NewsItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

  def create
    @news_item = NewsItem.new(params[:news_item])

    if params[:news_item][:image]
    name =  params[:news_item][:image].original_filename 
    directory = 'public/images/news_items'
    path = File.join(directory, name)

    if params[:news_item][:image].instance_of?(Tempfile)
      FileUtils.cp(params[:news_item][:image].local_path, path)
    else
      File.open(path, "wb") { |f| f.write(params[:news_item][:image].read) } 
    end
    @news_item.image = name
    end

      
        flash[:notice] = 'Сохранено.' if @news_item.save
        redirect_to news_items_path(:city_id => session[:city_act])
    

  end

  def edit
    @news_item = NewsItem.find(params[:id])
    @cities = City.find :all
  end

  def update
    @news_item = NewsItem.find(params[:id])
    name =  params[:news_item][:image].original_filename if params[:news_item][:image]
    directory = 'public/images/news_items'

    path = File.join(directory, name) if params[:news_item][:image]

    if params[:news_item][:image].instance_of?(Tempfile)
      FileUtils.cp(params[:news_item][:image].local_path, path)
    else
      File.open(path, "wb") { |f| f.write(params[:news_item][:image].read) } if params[:news_item][:image]
    end

    respond_to do |format|
      if @news_item.update_attributes(params[:news_item])
        @news_item.image = name if params[:news_item][:image]
        @news_item.save
        flash[:notice] = 'Сохранено.'
        format.html { redirect_to news_items_path(:city_id => session[:city_act])}
      end
    end
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy

    respond_to do |format|
      format.html { redirect_to news_items_path(:city_id => session[:city_act]) }
      format.xml  { head :ok }
    end
  end
end