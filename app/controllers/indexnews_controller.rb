class IndexnewsController < ApplicationController
layout 'search_nofoot'
before_filter:authorize
before_filter :redaktor
  def index
    #@indexnews = Indexnew.find(1)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @indexnews }
    end



  end

def new_logo
  if request.post?
    file = params[:logo][:logo]
    original_filename = file.original_filename

    path = File.join("#{RAILS_ROOT}/public/images2/", original_filename)
    File.open(path, 'wb') { | f | f.write(file.read) }

    @logo = Indexnew.find(2)
    @logo.new = original_filename
    @logo.save
    flash[:notice] = "Лого сохранено"
    redirect_to :action =>'index'
end

end

def usual_logo
     @logo = Indexnew.find(2)
    @logo.new = 'zlogo.jpg'
    @logo.save
    flash[:notice] = "Лого сохранено"
    redirect_to :action => 'index'
end



  # GET /indexnews/1/edit
  def edit
    @indexnew = Indexnew.find(params[:id])
  end

  # POST /indexnews
  # POST /indexnews.xml

  def update
    @indexnew = Indexnew.find(params[:id])

    respond_to do |format|
      if @indexnew.update_attributes(params[:indexnew])
        flash[:notice] = 'Indexnew was successfully updated.'
        format.html { redirect_to :controller=>'indexnews' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @indexnew.errors, :status => :unprocessable_entity }
      end
    end
  end


end
