class PictureController < ApplicationController

  def index
     @picture =Picture.find :all
  end

  def get
    @picture=Picture.new

  end

    def save
    @picture=Picture.new(params[:picture])
    if @picture.save
     redirect_to :action => 'index'
    #  redirect_to(:action => 'show' , :id => @picture.id )
    else
      render(:action => :get)
    end

  end

  def picture
    @picture =Picture.find(params[:id])
    send_data(@picture.data ,
               :filename => @picture.name ,
              :type => @picture.content_type ,
               :disposition => "inline" )
  end

  def show
    @picture=Picture.find(params[:id])

  end
   def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
redirect_to(:action=>'get')

  end

  def uploadFile
    pp=params[:upload]

    DataFile.save(pp)
     # DataFile.save(params[:upload])
    flash[:notice] = 'Фотография успешно загружена!'

    redirect_to(:controller=>'content',:action=>'admin')
  end
end