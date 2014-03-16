class DeskSubj < ActiveRecord::Base
  has_many :desk_answ
  belongs_to :picture
end
