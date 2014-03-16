class Fool12Controller < ApplicationController
  def index
    @podvals = Podval.find :all , :conditions=>['vis=?', 1]
    @podval = Podval.find(params[:id])
    # show=rand(2)+1
    render :partial => 'part/podval', :object => @podval
  end
end
