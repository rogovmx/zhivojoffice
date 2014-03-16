class ZakazCatalogsController < ApplicationController
  # GET /zakaz_catalogs
  # GET /zakaz_catalogs.xml
  #layout 'kanct'
   layout 'l_o1'
  def index
    redirect_to :action=>'new'
#    @zakaz_catalogs = ZakazCatalog.find(:all)
#  @zakaz_catalog = ZakazCatalog.new
#
#
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @zakaz_catalogs }
#    end
  end

  # GET /zakaz_catalogs/1
  # GET /zakaz_catalogs/1.xml
#  def show
#    @zakaz_catalog = ZakazCatalog.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @zakaz_catalog }
#    end
#  end

  # GET /zakaz_catalogs/new
  # GET /zakaz_catalogs/new.xml
  def new
    @zakaz_catalog = ZakazCatalog.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @zakaz_catalog }
    end


  end

  def zakaz_p
    if  params[:zakaz_p]
    @zakaz_p = Zakazp1.new(params[:zakaz_p])
      if @zakaz_p.save
         MailerZakaz.deliver_zakaz_p(@zakaz_p.adres,@zakaz_p.tel,@zakaz_p.fio ,@zakaz_p.city, @zakaz_p.c_name)
         flash[:notice] = 'Ваш заказ принят'
         redirect_to :action=>'new'
      end


  end
  end

  # GET /zakaz_catalogs/1/edit
#  def edit
#   # @zakaz_catalog = ZakazCatalog.find(params[:id])
#  end

  # POST /zakaz_catalogs
  # POST /zakaz_catalogs.xml
  def create
    
    
    
    @zakaz_catalog = ZakazCatalog.new(params[:zakaz_catalog])
    
    respond_to do |format|
      if @zakaz_catalog.save
         MailerZakaz.deliver_zakaz(@zakaz_catalog.adres,@zakaz_catalog.tel,@zakaz_catalog.fio ,@zakaz_catalog.city, @zakaz_catalog.c_name)
        flash[:notice] = 'Ваш заказ принят'
        format.html { redirect_to(:controller=>'kt1') }
        format.xml  { render :xml => @zakaz_catalog, :status => :created, :location => @zakaz_catalog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @zakaz_catalog.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  # PUT /zakaz_catalogs/1
  # PUT /zakaz_catalogs/1.xml
  def update
    @zakaz_catalog = ZakazCatalog.find(params[:id])

    respond_to do |format|
      if @zakaz_catalog.update_attributes(params[:zakaz_catalog])
        flash[:notice] = 'ZakazCatalog was successfully updated.'
        format.html { redirect_to(@zakaz_catalog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @zakaz_catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /zakaz_catalogs/1
  # DELETE /zakaz_catalogs/1.xml
#  def destroy
#    @zakaz_catalog = ZakazCatalog.find(params[:id])
#    @zakaz_catalog.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(zakaz_catalogs_url) }
#      format.xml  { head :ok }
#    end
#  end
end
