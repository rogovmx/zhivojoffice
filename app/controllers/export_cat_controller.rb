class ExportCatController < ApplicationController
   require 'iconv'
  def index
  headers['Content-Type'] = "application/vnd.ms-word"
  headers['Content-Disposition'] = 'attachment; filename="report1.doc"'
  headers['Cache-Control'] = ''


 @user=User.find_by_id(session[:user_id])
    
    @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
    @cat1=[]
    @cart.each { |cart| @cat1 << cart.k1s }
 
  end

    def bb
  headers['Content-Type'] = "application/vnd.ms-word"
  headers['Content-Disposition'] = 'attachment; filename="report1.doc"'
  headers['Cache-Control'] = ''
#  #headers['Charset']='windows-1251'
    #@cat1 = Cat1.find :all,:limit => 10

 @user=User.find_by_id(session[:user_id])
   # @items=Konkursitem.find :all, :conditions=>['konkursorder_id=?' ,1]
    @items=Konkursitem.find :all , :conditions=>['konkursorder_id=?' , params[:id].to_i]
    @cat1=[]
    @items.each { |cart| @cat1 << cart.k1s }


  end

  def catt
    @user=User.find_by_id(session[:user_id])
    @cart=Cart.find :all,:conditions=>['User_id=? or sesion_id=?',@user.id,request.session_options[:id]]
    @cat1=[]
    @cart.each { |cart| @cat1 << cart.k1s }
  end

end
