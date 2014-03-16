module Tov3sHelper
  def cat1s_count(tov2)
    @cat1s = []
    tov2.tov3.each do |tov3|
      @cat1s << tov3.cat1.count
    end
    return @cat1s.sum
  end

  def cat1s_visible_count(tov2)
  	@visible_cat1s = []
    tov2.tov3.each do |tov3|
      @visible_cat1s << tov3.cat1.visible.count
    end
    return @visible_cat1s.sum
  end

  def all_cat1s_in_tov3s
  	@all_cat1s = []
  	Tov3.all.each do |tov3|
  		@all_cat1s << tov3.cat1.visible.count
  	end
  	return @all_cat1s.sum
  end

  def all_cat1s
  	Cat1.visible.count
  end
end