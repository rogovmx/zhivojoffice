class TagCloudsController < ApplicationController
  # GET /tag_clouds
  # GET /tag_clouds.xml

   layout 'search_nofoot'
   before_filter :authorize
   before_filter :redaktor
  def index
    order='category, por'
    @tag_clouds = TagCloud.find :all,:order =>order

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tag_clouds }
    end
  end

  # GET /tag_clouds/1
  # GET /tag_clouds/1.xml
  def show
redirect_to :action=>'index'
  end

  # GET /tag_clouds/new
  # GET /tag_clouds/new.xml
  def new
    @tag_cloud = TagCloud.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag_cloud }
    end
  end

  # GET /tag_clouds/1/edit
  def edit
    @tag_cloud = TagCloud.find(params[:id])
  end

  # POST /tag_clouds
  # POST /tag_clouds.xml
  def create
    @tag_cloud = TagCloud.new(params[:tag_cloud])

    respond_to do |format|
      if @tag_cloud.save
        flash[:notice] = 'TagCloud was successfully created.'
        format.html { redirect_to(@tag_cloud) }
        format.xml  { render :xml => @tag_cloud, :status => :created, :location => @tag_cloud }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag_cloud.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tag_clouds/1
  # PUT /tag_clouds/1.xml
  def update
    @tag_cloud = TagCloud.find(params[:id])

    respond_to do |format|
      if @tag_cloud.update_attributes(params[:tag_cloud])
        flash[:notice] = 'TagCloud was successfully updated.'
        format.html { redirect_to(@tag_cloud) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag_cloud.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_clouds/1
  # DELETE /tag_clouds/1.xml
  def destroy
    @tag_cloud = TagCloud.find(params[:id])
    @tag_cloud.destroy

    respond_to do |format|
      format.html { redirect_to(tag_clouds_url) }
      format.xml  { head :ok }
    end
  end
end
