class ActController < ApplicationController
  layout 'search'
  def index
    if session[:city]=='smo'
      @sale_actions = SaleAction.find(:all, :conditions => { :city_id => 3, :visibility => 1 }, :order => "position")
    elsif session[:city]=='msk'
      @sale_actions = SaleAction.find(:all, :conditions => { :city_id => 1, :visibility => 1 }, :order => "position")
    else
      @sale_actions = SaleAction.find(:all, :conditions => { :city_id => 2, :visibility => 1 }, :order => "position")
    end
  end

  def mans
    redirect_to '/'
    #@content=Statp.find :first, :conditions=>["title=?",'10man']
  end

    def guest
       redirect_to '/'

    #@content=Statp.find :first, :conditions=>["title=?",'guest']
  end
   def clean
      redirect_to '/'
    #@content=Statp.find :first, :conditions=>["title=?",'clean']
  end

 def newman
    redirect_to '/'
    #@content=Statp.find :first, :conditions=>["title=?",'newman']
  end

 def act_spb
   @content=Statp.find :first, :conditions=>["title=?",'Акции_СПб']
 end
 def act_msk
   @content=Statp.find :first, :conditions=>["title=?",'Акции_Мск']
   render :action => 'act_spb'
 end

  def act2
   @content=Statp.find :first, :conditions=>["title=?",'Акции_2']
   render :action => 'act_spb'
 end

end
