class Cat1imgsController < ApplicationController
  # GET /cat1imgs
  # GET /cat1imgs.xml

  before_filter 'redaktor'

 
  def new
#    t1=params[:cat1img][:pic].insert(0, '/big/')
#    params[:cat1img][:pic]=t1
#    @cat1img = Cat1img.new(params[:cat1img])
#    @cat1img.save
    new_cat1_pic(params[:cat1img], params[:path],params[:id] )

    redirect_to :back
   # @cat1=Cat1.find(@cat1img.cat1_id)
   # render :update do |page|
   # page.replace_html( 'edit_tov', :partial=>'/part/edit_tov_pics',:object=>@cat1 )
   # end
  end


  def update
      upd_cat1_pic(params[:cat1img], params[:path],params[:id] )

    redirect_to :back

#    @cat1img = Cat1img.find(params[:id])
#    t1=params[:cat1img][:pic].insert(0, '/big/')
#    params[:cat1img][:pic]=t1
#    @cat1img.update_attributes(params[:cat1img])
#
#    @cat1=Cat1.find(@cat1img.cat1_id)
#
#    render :update do |page|
#    page.replace_html( 'edit_tov', :partial=>'/part/edit_tov_pics',:object=>@cat1 )
#    end
#
  end


  def destroy
    @cat1img = Cat1img.find(params[:id])
    @cat1img.destroy
   @cat1=Cat1.find(params[:cat1_id])
    render :update do |page|
    page.replace_html( 'edit_tov', :partial=>'/part/edit_tov_pics',:object=>@cat1 )
  end

  end

   def new_cat1_pic(upload, dir, id)
     name =  upload[:pic].original_filename if upload[:pic]
    directory = dir
    # create the file path
    path = File.join(directory, name) if upload[:pic]

    # write the file
    @b1=Cat1img.new
    t1=name.insert(0, '/big/')
    pic=t1[0..-5]
    @b1.pic=pic if upload[:pic]
    @b1.cat1_id=id
    @b1.save
   if upload[:pic].instance_of?(Tempfile)
   FileUtils.cp(upload[:pic].local_path, path)
   else
    File.open(path, "wb") { |f| f.write(upload[:pic].read) } if upload[:pic]
   end

    
  end

  def upd_cat1_pic(upload, dir, id)
    name =  upload[:pic].original_filename if upload[:pic]
    directory = dir
    # create the file path
    path = File.join(directory, name) if upload[:pic]

    # write the file
    @b1=Cat1img.find(id)
    t1=name.insert(0, '/big/')
    pic=t1[0..-5]
    @b1.pic=pic if upload[:pic]
    #@b1.cat1_id=id
    @b1.save
   if upload[:pic].instance_of?(Tempfile)
   FileUtils.cp(upload[:pic].local_path, path)
   else
   File.open(path, "wb") { |f| f.write(upload[:pic].read) } if upload[:pic]
   end
  end



end
