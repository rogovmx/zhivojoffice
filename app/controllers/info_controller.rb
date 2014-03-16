class InfoController < ApplicationController
  layout 'bas1'

  def bank_info

@menu=8
    
  end



  def dop_info
  
    
  @user=User.find_by_id(session[:user_id])
  redirect_to :controller =>'login' , :action=>'login' unless @user

  @client = Client.find_by_id(@user.client_id) if @user and @user.client_id
  @area = Area.all

  if request.post?
     @info = Info.new(params[:info])

       if @info.save
        Mailer.deliver_info(@info)

       flash[:notice] = 'Анкета отправлена'
       redirect_to('/')
      end
   


  end

  end


  def vacancy
    @names=['','января','февраля','марта','апреля','мая','июня','июля','августа','сентября','октября','ноября','декабря']
    @v_tmp = Vacancy.find :all , :conditions=>["visible=? and city=?",1,'Тверь'] , :order => 'created_at desc'
    if session[:city]=='msk'
     @vacancies = Vacancy.find(:all , :conditions=>["visible=? and city=?",1,'Москва'] , :order => 'created_at desc') + @v_tmp
    elsif session[:city]=='spb'
        @vacancies = Vacancy.find(:all , :conditions=>["visible=? and city=?",1,'Санкт-Петербург'] , :order => 'created_at desc') + @v_tmp
    elsif session[:city]=='smo'
      @vacancies  = Vacancy.find(:all , :conditions=>["visible=? and city=?",1,'Смоленск'] , :order => 'created_at desc') + @v_tmp
    else
       @vacancies  = Vacancy.find(:all, :conditions=>["visible=?",1]) 
    end
  end

  def zakaz
    @menu=1
    @content=Statp.find :first, :conditions=>["title=?",'Как сделать заказ']

  end

  def dostavka
    @menu=2
    if session[:city]=='spb'
    @content=Statp.find :first, :conditions=>["title=?",'Условия доставки']
    elsif  session[:city]=='msk'
    @content=Statp.find :first, :conditions=>["title=?",'Условия доставки Москва']
    elsif  session[:city]=='smo'
    @content=Statp.find :first, :conditions=>["title=?",'Условия доставки Смоленск']
    else
    @content=Statp.find :first, :conditions=>["title=?",'Условия доставки']
  end
  end

  def priem
    @menu=3
    @content=Statp.find :first, :conditions=>["title=?",'Как принимать товар']
  end

  def talon
    @menu=4
    @content=Statp.find :first, :conditions=>["title=?",'Гарантийные талоны']
  end

  def doci
    @menu=5
    @content=Statp.find :first, :conditions=>["title=?",'Шаблоны документов']
  end

  def shop
    @menu=6
    @content=Statp.find :first, :conditions=>["title=?",'Пользуйтесь интернет-магазином']
  end

def contest

end


 def ref
   @user=User.find_by_id(session[:user_id])
   redirect_to :controller=>'login' , :action=>'login' unless @user
 end

   def metress
    @menu=7
    render :layout=>'search'
  end


end
