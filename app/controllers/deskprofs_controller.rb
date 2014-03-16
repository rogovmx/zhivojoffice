class DeskprofsController < ApplicationController
  
   layout 'vvk_desk'
  def user
     @user=User.find_by_id(session[:user_id])
  end

  def index
    @deskprofs = Deskprof.find(:all)

      user
      @deskprof = Deskprof.find :first , :conditions=>['user_id=?',@user.id]
       if  @deskprof
         redirect_to :action=>'edit' , :id => @deskprof.id
       else
         redirect_to :action=>'new'
       end

  
  end

  # GET /deskprofs/1
  # GET /deskprofs/1.xml
  def show
   redirect_to(:controller=>'desk_subjs', :action=>'index')
  end

  # GET /deskprofs/new
  # GET /deskprofs/new.xml
  def new
        user
    @pict =Picture.find :all
    @pict_z = Picture.find :all , :conditions=>['redaktor=?',0 ]
    @pict_o = Picture.find :all , :conditions=>['redaktor=?',1 ]
    @pict_user = Picture.find :all , :conditions=>['user_id=?',@user.id ]
    @picture=Picture.new
    @ava = Deskavatar.find(:all)
      # @deskprofs=Deskprof.find :first, :conditions=>['user_id=?', @user.id]
    
    @deskprof = Deskprof.new

   
  end

  # GET /deskprofs/1/edit
  def edit
    user
    @pict =Picture.find :all
    @pict_z = Picture.find :all , :conditions=>['redaktor=?',0 ]
    @pict_o = Picture.find :all , :conditions=>['redaktor=?',1 ]
    @pict_user = Picture.find :all , :conditions=>['user_id=?',@user.id ]
    @picture=Picture.new
    @ava = Deskavatar.find(:all)
      # @deskprofs=Deskprof.find :first, :conditions=>['user_id=?', @user.id]
    @deskprof = Deskprof.find(params[:id])
  end

  # POST /deskprofs
  # POST /deskprofs.xml
  def create
    @deskprof = Deskprof.new(params[:deskprof])

    respond_to do |format|
      if @deskprof.save
        #flash[:notice] = 'Deskprof was successfully created.'
        format.html { redirect_to(@deskprof) }
      end
    end
  end

  # PUT /deskprofs/1
  # PUT /deskprofs/1.xml
  def update
    @deskprof = Deskprof.find(params[:id])

    respond_to do |format|
      if @deskprof.update_attributes(params[:deskprof])
        #flash[:notice] = 'Deskprof was successfully updated.'
        format.html { redirect_to(@deskprof) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deskprof.errors, :status => :unprocessable_entity }
      end
    end
  end

  def save
    @picture=Picture.new(params[:picture])
    if @picture.save
     redirect_to :action => 'index'

    else
      render(:action => :get)
    end
 #redirect_to :action => 'edit'
  end

  def picture
    @picture =Picture.find(params[:id])
    send_data(@picture.data ,
               :filename => @picture.name ,
              :type => @picture.content_type ,
               :disposition => "inline" )
  end

 def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
redirect_to :action=>'index'

  end
end
