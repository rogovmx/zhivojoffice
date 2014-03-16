class Zz2Controller < ApplicationController
  layout 'vvk'

 def new
      zz1=Zz1.new(params[:zz1])
    zz1.save
    Mailer.deliver_zz(zz1.phone,zz1.name,zz1.quest , zz1.company)
     #flash[:notice] = 'Наш оператор свяжется с Вами.'
     render :text=>'<h2 style="color: green"> Наш оператор свяжется с Вами. </h2>'
 end

 
def index
 # @manager=Manager1.find :all

  
end

end
