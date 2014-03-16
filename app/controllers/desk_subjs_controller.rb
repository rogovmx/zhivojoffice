class DeskSubjsController < ApplicationController
 layout 'vvk_desk'

 require "will_paginate"
  
  def user
    @user=User.find_by_id(session[:user_id])
   end
  
  def q_answ
  
  user
  @q_answ = Questionansw.new(params[:q_answ])
  @q_answ.save
 
  redirect_to :controller=>'desknews' , :action=>'thanks' , :id=>@q_answ.q_id
 end

 def thanks
    render :text=>'Всем спасибо!'
 end
 
  def index
    session[:original_uri]=request.request_uri
     user
    
    @ava = Deskavatar.find(:all)
    @deskprof = Deskprof.find(:all)
    @desk_subjs = DeskSubj.paginate :order => 'created_at desc' ,:page => params[:page], :per_page =>10
    #@desk_subj_new = DeskSubj.new
    @questions = Question.find(:all)

  end

  def news
   
    @pname1=Newspic.find(params[:id])
    render :partial=>'pics', :object=>@pname1

  end

  def wallpaper
   
  end

  def save_mess
    @desk_subj_new = DeskSubj.new(params[:desk_subj_new])
    @desk_subj_new.save
    redirect_to :action=>'index'
end

  def save_answ
    @desk_subj_new = DeskAnsw.new(params[:desk_answ_new])
    @desk_subj_new.save
    redirect_to :action=>'index'
end

def new_answ
@user=User.find_by_id(session[:user_id])
 @desk_subj_id=DeskSubj.find(params[:id])
 render :partial=>'/desk_subjs/new_answ'
 #, :object=>@desk_subj_id, :object=>@user

end

 def picture
    @picture =Picture.find(params[:id])
    send_data(@picture.data ,
               :filename => @picture.name ,
              :type => @picture.content_type ,
               :disposition => "inline" )
  end


  def show
   redirect_to  :action=>'index'

  end

 

  # GET /desk_subjs/1/edit
  def edit
    @desk_subj = DeskSubj.find(params[:id])
  end

  # POST /desk_subjs
  # POST /desk_subjs.xml
  def create
    @desk_subj = DeskSubj.new(params[:desk_subj])

    respond_to do |format|
      if @desk_subj.save
        flash[:notice] = 'DeskSubj was successfully created.'
        format.html { redirect_to(@desk_subj) }
        format.xml  { render :xml => @desk_subj, :status => :created, :location => @desk_subj }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @desk_subj.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /desk_subjs/1
  # PUT /desk_subjs/1.xml
  def update
    @desk_subj = DeskSubj.find(params[:id])

    respond_to do |format|
      if @desk_subj.update_attributes(params[:desk_subj])
        flash[:notice] = 'DeskSubj was successfully updated.'
        format.html { redirect_to(@desk_subj) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @desk_subj.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /desk_subjs/1
  # DELETE /desk_subjs/1.xml
  def destroy
    @desk_subj = DeskSubj.find(params[:id])
    @desk_subj.destroy

    respond_to do |format|
      format.html { redirect_to(desk_subjs_url) }
      format.xml  { head :ok }
    end
  end

  def test
    user
  

  end


end
