class Mess1Controller < ApplicationController
  def index
    
    #@m1=guj

  end

  def first
    
    mess=Messager.new(params[:messager])
    mess.save

    redirect_to :action=>'say',:id_m=>mess.id,:name_m=>mess.name
   
  end

  def say
   @id=params[:id_m]
   #@name=params[:name_m]

   @cont1=Messager.find(params[:id_m])
   @name=@cont1.name
   @m_pr1=Mcontent1.find :first ,:conditions=>["messager_id=?",params[:id_m]]
   if @m_pr1

   else
   mcontent=Mcontent1.new
   mcontent.messager_id=params[:id_m]
   mcontent.content=@cont1.content
   mcontent.name=@name
   mcontent.save
   
   end
   
   @content=Mcontent1.find :all,:conditions=>["messager_id=?",params[:id_m]]

  end

  def boltov
    @content=Mcontent1.find :all,:conditions=>["messager_id=?",params[:id_m]]
    render(:partial =>'bolt1',:object=>@content)
  end

  def newcontent
    mcontent=Mcontent1.new(params[:mcontent])
    mcontent.save
    redirect_to :controller=>'mess1',:action=>'say',:id_m=>mcontent.messager_id
  end

end
