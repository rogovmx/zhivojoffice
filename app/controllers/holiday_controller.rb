class HolidayController < ApplicationController
  layout 'l_o1'

  def index

  end
  def days
    @month = params[:id]
    render :partial=>'/holiday/days' , :object=>@month
  end



end
