class Deskavatar < ActiveRecord::Base
  #belongs_to :deskprof
  has_one  :deskprof
  belongs_to :picture
end
