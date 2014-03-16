class UploadController < ApplicationController
   before_filter :authorize
   before_filter :redaktor

  def index

  end
   def index1
   end
   def redaktor1

   end
def bonus
end
def bonus11
end
def bonus12
end

  def uploadfile
    DataFile.save(params[:upload])
   
    redirect_to :controller=>'kt'
  end

   def upload_price
     list=Dir.entries("public/data")
     ll=list.length
       if ll!=2
       flash[:notice]="Надо чуть чуть подождать!"
       redirect_to :back
       else
       DataFile.save(params[:upload])
      list1=Dir.entries("public/data")
       flash[:notice]="Обновления успешно проведены!"
     #redirect_to :controller=>'zal1',:action=>'zal_price',:file=>list1[2]
      redirect_to :controller=>'zal_ex1',:action=>'index',:file=>list1[2]
       end
    
   end
    def upload_redaktor
     list=Dir.entries("public/data")
     ll=list.length
       if ll!=2
       flash[:notice]="Надо чуть чуть подождать!"
       redirect_to :back
       else
       DataFile.save(params[:upload])
      list1=Dir.entries("public/data")
       flash[:notice]="Обновления успешно проведены!"
     #redirect_to :controller=>'zal1',:action=>'zalcat1',:file=>list1[2]
       redirect_to :controller=>'zal_ex1',:action=>'zal_b',:file=>list1[2]
       end

   end

    def inviz1
     list=Dir.entries("public/data")
     ll=list.length
       if ll!=2
       flash[:notice]="Надо чуть чуть подождать!"
       redirect_to :back
       else
       DataFile.save(params[:upload])
      list1=Dir.entries("public/data")
       flash[:notice]="Обновления успешно проведены!"
     #redirect_to :controller=>'zal1',:action=>'zalcat1',:file=>list1[2]
       redirect_to :controller=>'del_tov',:action=>'index',:file=>list1[2]
       end

   end





    def upload_bonus
     list=Dir.entries("public/data")
     ll=list.length
       if ll!=2
       flash[:notice]="Надо чуть чуть подождать!"
       redirect_to :back
       else
       DataFile.save(params[:upload])
      list1=Dir.entries("public/data")
       flash[:notice]="Обновления успешно проведены!"
     redirect_to :controller=>'zal1',:action=>'zal_bonus',:file=>list1[2]

       end

   end

     def upload_bonus11
     list=Dir.entries("public/data")
     ll=list.length
       if ll!=2
       flash[:notice]="Надо чуть чуть подождать!"
       redirect_to :back
       else
       DataFile.save(params[:upload])
      list1=Dir.entries("public/data")
       flash[:notice]="Обновления успешно проведены!"
     redirect_to :controller=>'zal1',:action=>'zal_bonus11',:file=>list1[2]

       end

   end
     def upload_bonus12
     list=Dir.entries("public/data")
     ll=list.length
       if ll!=2
       flash[:notice]="Надо чуть чуть подождать!"
       redirect_to :back
       else
       DataFile.save(params[:upload])
      list1=Dir.entries("public/data")
       flash[:notice]="Обновления успешно проведены!"
     redirect_to :controller=>'zal1',:action=>'zal_bonus12',:file=>list1[2]

       end

   end

  def pp
    list=Dir.entries("public/data")
    ll=list.length
    @list=list[0,ll]
  end
  def pp1
    list=Dir.entries("public/data")
    ll=list.length
    @list=list[2,ll]
  end

   def pp2
    list=Dir.entries("public/data")
    ll=list.length
    @list=list[2,ll]
  end
end
