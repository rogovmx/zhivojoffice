class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
#  layout 'spens1'
#layout 'kanct_admin'
layout 'l_o1'
 before_filter :authorize
  before_filter :admin_call


  # GET /users/1/edit
  def edit

    @user = User.find(params[:id])
    @ww='www'
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
       
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        u_crm(@user_id)
        flash[:notice] = 'User was successfully updated.'
         format.html { redirect_to :controller=>'call1' }
       # format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
   def u_crm(id)
     @user=User.find(params[:id])
     @user_crm=UserCrm.new
     @user_crm.user_id=@user.id
     @user_crm.scr_name=@user.scr_name
     @user_crm.patronymic=@user.patronymic
     @user_crm.surname=@user.surname
     @user_crm.phone=@user.phone
     @user_crm.m_phone=@user.m_phone
     @user_crm.company=@user.company
     @user_crm.company_ind=@user.company_ind
     @user_crm.last_visit=@user.last_visit
     @user_crm.role=@user.role
     @user_crm.name=@user.name
     @user_crm.hashed_password=@user.hashed_password
     @user_crm.salt=@user.salt
     @user_crm.mail=@user.mail
     @user_crm.client_id=@user.client_id
     @user_crm.email_confirm=@user.email_confirm
     @user_crm.save


   end

end
