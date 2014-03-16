class Bcat1sController < ApplicationController
  # GET /bcat1s
  # GET /bcat1s.xml
   layout 'search_nofoot'

before_filter:authorize
before_filter :manager

    def user
    @user=User.find(session[:user_id])
  end


  def index
    user
    @bcat1s=Bcat1.find :all,:conditions=>["btg1_id=?", params[:btg1]]
    @btg=Btg1.find_by_id( params[:btg1])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bcat1s }
    end
  end

  # GET /bcat1s/1
  # GET /bcat1s/1.xml
  def show
    @bcat1 = Bcat1.find(params[:id])
 redirect_to :action=>'index' , :btg1=>@bcat1.btg1_id
  end

  # GET /bcat1s/new
  # GET /bcat1s/new.xml
  def new
    @bcat1 = Bcat1.new
    @btg=Btg1.find_by_id( params[:btg1])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bcat1 }
    end
  end

  # GET /bcat1s/1/edit
  def edit
    @bcat1 = Bcat1.find(params[:id])
     @btg=Btg1.find_by_id( params[:btg1])
  end

  # POST /bcat1s
  # POST /bcat1s.xml
  def create
    @bcat1 = Bcat1.new(params[:bcat1])
    @cat=Cat1.find :first , :conditions=>['k1c=? and vis=?',@bcat1.s1, 1]
    if @cat
      @bcat1.cat1_id=@cat.id
    else
      @cat2=Cat1.find :first , :conditions=>['k1c=? and vis=?',@bcat1.s1, 0]
      if @cat2
      @bcat1.cat1_id=@cat2.id
      end
    end
    respond_to do |format|
      if @bcat1.save
        flash[:notice] = 'Номенклатура сохранена.'
        format.html { redirect_to(:action=>'edit' , :id=>@bcat1.id, :btg1=>@bcat1.btg1_id) }
        format.xml  { render :xml => @bcat1, :status => :created, :location => @bcat1 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bcat1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bcat1s/1
  # PUT /bcat1s/1.xml
  def update
    @bcat1 = Bcat1.find(params[:id])

    respond_to do |format|
      if @bcat1.update_attributes(params[:bcat1])
        flash[:notice] = 'Bcat1 was successfully updated.'
        format.html { redirect_to(@bcat1) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bcat1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bcat1s/1
  # DELETE /bcat1s/1.xml
  def destroy
    @bcat1 = Bcat1.find(params[:id])
    @tmp=@bcat1.btg1_id
    @bcat1.destroy
 redirect_to :action=>'index' , :btg1=>@tmp
  end
end
