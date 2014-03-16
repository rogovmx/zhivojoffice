class MainController < ApplicationController
  layout 'main_index'

  def index
    @b_goods = Cat1.find :all , :conditions=>['vis = ?', 1] , :limit => 4
    @n_goods = Cat1.find :all , :conditions=>['vis = ? and tov3_id = ?', 1,373] , :limit => 4
    @l_goods = Cat1.find :all , :conditions=>['vis = ? and tov3_id = ?', 1,227] , :limit => 4

    @categories = Razdel1.find :all , :limit => 7
    @groups = []
    for cat in @categories do
      @groups += First1.find(:all, :conditions => ['kod > ? and kod < ?',cat.id*100, (cat.id+1)*100 ] , :order => 'kod')
    end

  end

  def goods
  end


  def create_cart

     render :update do |page|
       page.replace_html( "zakaz_#{params[:id]}", :partial=>'/part_main/in_cart' )
       page.replace_html( 'cart', :partial=>'/part_main/top_cart'  )

      # page.visual_effect(:blind_down, 'all_cont', :duration=> 0.2)
     end


  end


  def create_comp
     render :update do |page|
       page.replace_html( "comp_#{params[:id]}", :partial=>'/part_main/in_comp' )
       page.replace_html( 'comp', :partial=>'/part_main/top_comp'  )

      # page.visual_effect(:blind_down, 'all_cont', :duration=> 0.2)
     end
    
  end





end
