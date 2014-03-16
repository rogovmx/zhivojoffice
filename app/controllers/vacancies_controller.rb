class VacanciesController < ApplicationController
  # GET /vacancies
  # GET /vacancies.xml
 layout "search_nofoot"
 before_filter :authorize
 before_filter :redaktor

  def index
    if params[:city] == "Санкт-Петербург"
      @vacancies = Vacancy.find(:all, :conditions=>["city=?",'Санкт-Петербург'] , :order => 'created_at desc')
    elsif params[:city] == "Москва"
      @vacancies = Vacancy.find(:all, :conditions=>["city=?",'Москва'] , :order => 'created_at desc')
    elsif params[:city] == "Тверь"
      @vacancies = Vacancy.find(:all, :conditions=>["city=?",'Тверь'] , :order => 'created_at desc')
    else
      @vacancies = Vacancy.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vacancies }
    end
  end

  # GET /vacancies/1
  # GET /vacancies/1.xml
  def show
redirect_to :action=>'index'
  end

  # GET /vacancies/new
  # GET /vacancies/new.xml
  def new
    @vacancy = Vacancy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vacancy }
    end
  end

  # GET /vacancies/1/edit
  def edit
    @vacancy = Vacancy.find(params[:id])
  end

  # POST /vacancies
  # POST /vacancies.xml
  def create
    @vacancy = Vacancy.new(params[:vacancy])

    respond_to do |format|
      if @vacancy.save
        flash[:notice] = 'Вакансия добавлена'
        format.html { redirect_to(@vacancy) }
        format.xml  { render :xml => @vacancy, :status => :created, :location => @vacancy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vacancy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vacancies/1
  # PUT /vacancies/1.xml
  def update
    @vacancy = Vacancy.find(params[:id])

    respond_to do |format|
      if @vacancy.update_attributes(params[:vacancy])
        flash[:notice] = 'Вакансия обновлена'
        format.html { redirect_to vacancies_path(:city => @vacancy.city) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vacancy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancies/1
  # DELETE /vacancies/1.xml
  def destroy
    @vacancy = Vacancy.find(params[:id])
    @vacancy.destroy

    respond_to do |format|
      format.html { redirect_to(vacancies_url) }
      format.xml  { head :ok }
    end
  end
end
