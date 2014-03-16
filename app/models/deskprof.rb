class Deskprof < ActiveRecord::Base
  belongs_to :user
   belongs_to :deskavatar
   belongs_to :picture
end
