class Mess2Controller < ApplicationController
 before_filter :mess

  def index

     @first=Messu1.find :first,:conditions=>["name=?",'Елена']
     if @first.present==0
       @first.present=1
       @first.save
     end
    @mess=Messager.find :all,:conditions=>["pc=?",1]
  #  if params[:id]
     # @content=Messager.find :all,:conditions=>["messager_id=?",params[:id]]
   # end
   @messA=Messager.find :all,:conditions=>["pc=?",2]
  end

  def index1

    @mess=Messager.find :all,:conditions=>["pc=?",1]
  render(:partial =>'bolt3',:object=>@content)
  end
 def oper
    @content=Mcontent1.find :all,:conditions=>["messager_id=?",params[:id]]
     render(:partial =>'oper1',:object=>@content)
 end
 def oper1
    @content=Mcontent1.find :all,:conditions=>["messager_id=?",params[:id]]
     render(:partial =>'oper11',:object=>@content)
 end
 def newcontent
    mcontent=Mcontent1.new(params[:mcontent])
    mcontent.save
    redirect_to :controller=>'mess2',:action=>'index'
  end

 def boltov
    @content=Mcontent1.find :all,:conditions=>["messager_id=?",params[:id]]
    #render(:partial =>'bolt2',:object=>@content)
    render(:partial =>'bolt2',:object=>@content)
  end

 def arhiv
   @mess=Messager.find(params[:id])
   @mess.pc=2
   @mess.save
   redirect_to :controller=>'mess2'
 end
  def arhiv1
   @mess=Messager.find(params[:id])
   @mess.pc=3
   @mess.save
   redirect_to :controller=>'mess2'
 end

  def logout
    @logout=Messu1.find :first,:conditions=>["name=?",'Елена']
    @logout.present=0
    @logout.save
    redirect_to :controller=>'kt1'
  end
end
