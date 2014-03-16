class Picture < ActiveRecord::Base
 # belongs_to :desk_subj
  #belongs_to :desk_answ
  #belongs_to :deskprof
    has_one  :deskprof
    has_one :desk_sibj
    has_one :desk_answ
  validates_format_of :content_type,
                      :with => /^image/,
                      :message => " - можно выкладывать только изображения"

 def uploaded_picture=(picture_field)
   self.name  = base_part_of(picture_field.original_filename)
   self.content_type = picture_field.content_type.chomp
   self.data = picture_field.read
 end

 def base_part_of(file_name)
   File.basename(file_name).gsub(/[^\w._-]/, '')
 end
end
