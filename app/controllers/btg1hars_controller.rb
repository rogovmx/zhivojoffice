class Btg1harsController < ApplicationController
  # GET /btg1hars
  # GET /btg1hars.xml
  def find_s(id,s)
    @btg1=Btg1.find(id)
    case s
    when '1'
    @s=@btg1.s1
    when '2'
    @s=@btg1.s2
    when '3'
    @s=@btg1.s3
    when '4'
    @s=@btg1.s4
    when '5'
    @s=@btg1.s5
    when '6'
    @s=@btg1.s6
    when '7'
    @s=@btg1.s7
    when '8'
    @s=@btg1.s8
    when '9'
    @s=@btg1.s9
    when '10'
    @s=@btg1.s10
    when '11'
    @s=@btg1.s11
    when '12'
    @s=@btg1.s12
    when '13'
    @s=@btg1.s13
    when '14'
    @s=@btg1.s14
    when '15'
    @s=@btg1.s15
    when '16'
    @s=@btg1.s16
    when '17'
    @s=@btg1.s17
    when '18'
    @s=@btg1.s18
    when '19'
    @s=@btg1.s19
    when '20'
    @s=@btg1.s20
    when '21'
    @s=@btg1.s21
    when '22'
    @s=@btg1.s22
    when '23'
    @s=@btg1.s23
    when '24'
    @s=@btg1.s24
    when '25'
    @s=@btg1.s25
    when '26'
    @s=@btg1.s26
    when '27'
    @s=@btg1.s27
    when '28'
    @s=@btg1.s28
    when '29'
    @s=@btg1.s29
    when '30'
    @s=@btg1.s30
    end

  end

  def index
    @btg1hars = Btg1har.find :all , :conditions=>['btg1_id=? and s=?',params[:id],params[:s]]
    redirect_to(:action=>'new' , :id=>params[:id] , :s=>params[:s]) if @btg1hars.size == 0
    find_s(params[:id].to_i, params[:s]) 


  end

  # GET /btg1hars/1
  # GET /btg1hars/1.xml
  def show
   @btg1har=Btg1har.find(params[:id].to_i)
   redirect_to(:action=>'index' , :id=>@btg1har.btg1_id, :s=>@btg1har.s)
  
  end

  # GET /btg1hars/new
  # GET /btg1hars/new.xml
  def new
   find_s(params[:id], params[:s])
    @btg1har = Btg1har.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @btg1har }
    end
  end

  # GET /btg1hars/1/edit
  def edit
    @btg1har = Btg1har.find(params[:id])
    find_s(@btg1har.btg1_id, params[:s])
    
  end

  # POST /btg1hars
  # POST /btg1hars.xml
  def create
    @btg1har = Btg1har.new(params[:btg1har])

    respond_to do |format|
      if @btg1har.save
        flash[:notice] = 'Btg1har was successfully created.'
        format.html { redirect_to(@btg1har) }
        format.xml  { render :xml => @btg1har, :status => :created, :location => @btg1har }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @btg1har.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /btg1hars/1
  # PUT /btg1hars/1.xml
  def update
    @btg1har = Btg1har.find(params[:id])

    respond_to do |format|
      if @btg1har.update_attributes(params[:btg1har])
        flash[:notice] = 'Btg1har was successfully updated.'
        format.html { redirect_to(@btg1har) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @btg1har.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /btg1hars/1
  # DELETE /btg1hars/1.xml
  def destroy
    @btg1har = Btg1har.find(params[:id])
    tmp=@btg1har.btg1_id
    tmp2=@btg1har.s
    @btg1har.destroy
   @btg1=Btg1.find(tmp)
   redirect_to(:action=>'index' , :id=>@btg1.id, :s=>tmp2)
  end
end
