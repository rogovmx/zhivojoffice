class ConfirmsController < ApplicationController
  # GET /confirms
  # GET /confirms.xml
  def index
    rnd=params[:confirm]
    confirms = Confirm.find(:first,:conditions=>["rnd=?",rnd])
    if confirms==nil
      redirect_to :controller=>'kt1'
    else
      user_id=confirms.user_id
      user=User.find(user_id)
      user.email_confirm=1
      user.save
      
      confirms.destroy
       session[:user_id] = user.id
      redirect_to :controller=>'kt1'
    end
  end

def pass
    rnd=params[:confirm]
    confirms = Confirm.find(:first,:conditions=>["rnd=?",rnd])
    if confirms==nil
      redirect_to :controller=>'kt1'
    else
      user_id=confirms.user_id
      user=User.find(user_id)
      user.email_confirm=1
      user.save

      confirms.destroy
       session[:user_id] = user.id
      if params[:order]=='1'
      redirect_to :controller=>'cabinet',:action=>'feedback'
      else
      redirect_to :controller=>'cabinet',:action=>'reg_data'
      end
    end
  end


  


 
 

  # DELETE /confirms/1
  # DELETE /confirms/1.xml
  def destroy
    @confirm = Confirm.find(params[:id])
    @confirm.destroy

    respond_to do |format|
      format.html { redirect_to(confirms_url) }
      format.xml  { head :ok }
    end
  end
end
