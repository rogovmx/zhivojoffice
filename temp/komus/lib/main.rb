require 'net/http'
require 'fileutils'
require 'parseexcel'


exel=Spreadsheet::ParseExcel.parse('13_10_11.xls')
#name=File.basename('kody_komusa.xls', '.xls')
#puts name

worksheet1 = exel.worksheet(0,0)
ee=[]
iii=0
worksheet1.each { |row| iii+=1;  puts 'N'; puts iii; ii=0; row.each { |cell|
     ii+=1
     if ii==1
         e=cell.to_s('ISO-8859-1')
      puts 'id='
      puts e
        ee<<e
      elsif ii>1
    
    end 
    #
     }
}




############################################################

 # i=599
#while i < 610 do
out=File.new('13_10_11.csv','w')
ee.each do |i|
    url = URI.parse('http://www.komus.ru/product/'+i.to_s)
  # url = URI.parse('http://www.komus.ru/product/141002')
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    ee=res.body
   

   pos1=ee.index('<span id="Price')

   if pos1 !=nil
   ee1=ee[pos1,35]
   pos11=ee1.index('>')
   pos12= ee1.index('</')
   price=ee1[pos11+1,pos12-pos11-1]
   
   ss=i.to_s+';'+ price
  
   out.puts ss
   puts 'цена'
   puts ss
   end

 
  sleep(1)
end
out.close
 puts 'rrrr'