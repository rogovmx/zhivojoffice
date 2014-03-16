class PagesController < ApplicationController
  # GET /pages
  def index
   
  end

  
  # GET /pages/1/edit
  def edit
    @page = Main1.find(params[:id])
  end
  
  # PUT /pages/1
  def update
    @page = Main1.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Сохранено."
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
  

end
