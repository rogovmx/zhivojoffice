class CitiesController < ApplicationController
  before_filter :authorize
  before_filter :redaktor
  layout 'search_nofoot'
  def index
    @cities = City.find :all
    @city = City.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cities }
    end
  end

  def create
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        flash[:notice] = 'Сохранено.'
        format.html { redirect_to cities_path }
      end
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])

    respond_to do |format|
      if @city.update_attributes(params[:city])
        flash[:notice] = 'Сохранено.'
        format.html { redirect_to cities_path }
      end
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html { redirect_to cities_path }
      format.xml  { head :ok }
    end
  end
end