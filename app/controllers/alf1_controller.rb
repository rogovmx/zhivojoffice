class Alf1Controller < ApplicationController
  layout 'search'
 require 'iconv'
  def index
    unless read_fragment(:fragment=>'alf')
     @brend=Cat1.find_by_sql(["select distinct name from tov3s where name is not NULL and not(name like ' ') and vis=1 order by name asc"])
     @ages1=[]
      @brend.each do |bb|
      converter=Iconv.new('Windows-1251','UTF-8')
      bb2=converter.iconv(bb.name)
      #bb1=bb2
      bb3=bb2[0,1]
      #  qw << bb.brend.trim!

      @ages1 << bb3
      end
      @ages=@ages1.uniq
    end
  end

end
