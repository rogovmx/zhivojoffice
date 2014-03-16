class Mess3Controller < ApplicationController
  def index
     @content=Mcontent1.find :all,:conditions=>["messager_id=?",params[:id_m]]
     @pc=Messager.find(params[:id_m])
     if @pc.pc==1

       render(:partial =>'bolt1',:object=>@content)
     else
       render(:partial =>'bolt2',:object=>@content)
     end
  end
  def bolt
    @content=Mcontent1.find :all,:conditions=>["messager_id=?",params[:id_m]]
    render(:partial =>'bolt2',:object=>@content)
  end

end
