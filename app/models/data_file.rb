class DataFile < ActiveRecord::Base
  def self.new_cat1_pic(upload, dir, id)
    name =  upload[:pic].original_filename if upload[:pic]
    directory = dir
    # create the file path
    path = File.join(directory, name) if upload[:pic]
    
    # write the file
    @b1=Cat1img.new
    t1=name.insert(0, '/big/')
    pic=t1[0..-5]
    @b1.pic=pic if upload[:pic]
    @b1.cat1_id=id
    @b1.save
    File.open(path, "wb") { |f| f.write(upload[:pic].read) } if upload[:pic]
  end

  def self.upd_cat1_pic(upload, dir, id)
    name =  upload[:pic].original_filename if upload[:pic]
    directory = dir
    # create the file path
    path = File.join(directory, name) if upload[:pic]

    # write the file
    @b1=Cat1img.find(id)
    t1=name.insert(0, '/big/')
    pic=t1[0..-5]
    @b1.pic=pic if upload[:pic]
    #@b1.cat1_id=id
    @b1.save
    File.open(path, "wb") { |f| f.write(upload[:pic].read) } if upload[:pic]
  end
end
