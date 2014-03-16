class BrendsController < ApplicationController
 layout 'search'
 require 'iconv'
  def index
    unless read_fragment(:fragment=>'brends')
     @all=Cat1.find :all ,:select=>'brend', :conditions=>['vis=?',1] , :order=>'brend asc'

     #@brend=Cat1.find_by_sql(["select distinct brend from cat1s where brend is not NULL and not(brend like ' ') order by brend asc"])
     @brend=@all.uniq.compact

          @btmp=[]
      for all in @all do
      @btmp<<all.brend.strip if all.brend != nil
     end
     @brend=@btmp.uniq

     @ages1=[]
      @brend.each do |bb|
      converter=Iconv.new('Windows-1251','UTF-8')
      bb2=converter.iconv(bb.strip)
      #bb1=bb2
      bb3=bb2[0,1]
      #  qw << bb.brend.trim!
      
      @ages1 << bb3
      end
      @ages=@ages1.uniq


  end
  end

  

end
