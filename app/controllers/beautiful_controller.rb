class BeautifulController < ApplicationController
   layout 'search'

  def index
  
  end

    def user
    @user=User.find_by_id(session[:user_id])

 end

  def room1
    user
    @bc=Beautycat.find :all, :conditions=>['room=?',1]
    @tg=[]
    for bc in @bc do
      @tmp=Cat1.find_by_k1c(bc.k1c)
      @tg<<@tmp
    end

  end

  def room2
    user
    @bc=Beautycat.find :all, :conditions=>['room=?',2]
    @tg=[]
    for bc in @bc do
      @tmp=Cat1.find_by_k1c(bc.k1c)
      @tg<<@tmp
    end

  end

  def room3
    user
    @bc=Beautycat.find :all, :conditions=>['room=?',3]
    @tg=[]
    for bc in @bc do
      @tmp=Cat1.find_by_k1c(bc.k1c)
      @tg<<@tmp
    end

  end

  def room4
    user
        @bc=Beautycat.find :all, :conditions=>['room=?',4]
    @tg=[]
    for bc in @bc do
      @tmp=Cat1.find_by_k1c(bc.k1c)
      @tg<<@tmp
    end


  end

end


