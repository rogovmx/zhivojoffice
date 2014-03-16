class EmlController < ApplicationController
   layout 'l_o1'


  def smp
    
  end

  def em
  end

def pass

@mail=User.find :all ,:conditions=>["mail=?",params[:email]]

end
def ppp
  @user=User.find(params[:id])
  #@cc=Confirm



      rnd=rand(999999999999999999999999999999999999999999)
      conf=Confirm.new
      conf.user_id=@user.id
      conf.rnd=rnd
      conf.save
      Mailer.deliver_pass(@user.mail,@user.name,rnd)
      #Mailer.deliver_new1(@user.mail,@user.scr_name,@user.name,@user.password,@user.surname,@user.phone,@user.company_ind,@user.inn)
      redirect_to :controller=>'eml',:action=>'smp'
end

end
