class ComicsController < ApplicationController
    layout 'search'
  def index


    @comix=Comix1.all
    @c=[]
$comix=3 if params[:com]=='3' 
$comix=2 if params[:com]=='2'
$comix=1 if params[:com]=='1'


if $comix==nil or $comix==3
    @comix.each {|comix| @c << comix.pic if comix.com_id == 3 }
else
    @comix.each {|comix| @c << comix.pic if comix.com_id == $comix }

end

    redirect_to :action=>'next' if params[:id].to_i>@c.size-1

    @pic=@c[0] if params[:id]== nil
    @pic=@c[params[:id].to_i] if params[:id]!= nil
end

def save_mess
    @comics1 = Comics1.new(params[:comics1])
    @comics1.save
    redirect_to :action=>'next'
end


def next
    @comix=Comix1.all
    @c=[]
$comix=2 if params[:com]=='2'
$comix=1 if params[:com]=='1'


if $comix==nil or $comix=='2'
    @comix.each {|comix| @c << comix.pic if comix.com_id == 2 }
else
    @comix.each {|comix| @c << comix.pic if comix.com_id == 1 }
end

     @user=User.find_by_id(session[:user_id])
      @comics1s = Comics1.find(:all)
  end


  end
