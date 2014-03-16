class Cat1sController < ApplicationController
  # GET /cat1s
  # GET /cat1s.xml
  before_filter :authorize
   before_filter :redaktor

  def create
    @cat1 = Cat1.new(params[:cat1])

    respond_to do |format|
      if @cat1.save
        flash[:notice] = 'Cat1 was successfully created.'
       format.html { redirect_to(:back) }
       # format.xml  { render :xml => @cat1, :status => :created, :location => @cat1 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cat1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cat1s/1
  # PUT /cat1s/1.xml
  def update
    @cat1 = Cat1.find(params[:id])
    name =  params[:cat1][:pic1].original_filename if params[:cat1][:pic1]
    directory = 'public/img'
    directory_1c = 'public/images_1c'
    path = File.join(directory, name) if params[:cat1][:pic1]
    path_1c = File.join(directory_1c, name) if params[:cat1][:pic1]
 #  if params[:cat1][:pic1].instance_of?(Tempfile)
 #  FileUtils.cp(params[:cat1][:pic1].local_path, path)
 #  else
   File.open(path, "wb") { |f| f.write(params[:cat1][:pic1].read) } if params[:cat1][:pic1]
   FileUtils.cp(path, path_1c) if params[:cat1][:pic1]
 #  end



    respond_to do |format|
      if @cat1.update_attributes(params[:cat1])
          pic = name[0..-5] if name
          @cat1.pic1 = pic if params[:cat1][:pic1]
          @cat1.save
        flash[:notice] = 'Сохранено.'
        format.html { redirect_to(:back) }
      end
    end
  end

  # DELETE /cat1s/1
  # DELETE /cat1s/1.xml
  def destroy
    @cat1 = Cat1.find(params[:id])
    @cat1.destroy

    respond_to do |format|
      format.html { redirect_to(cat1s_url) }
      format.xml  { head :ok }
    end
  end
end
