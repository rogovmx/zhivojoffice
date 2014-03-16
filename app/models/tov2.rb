class Tov2 < ActiveRecord::Base
  has_many :tov3
  belongs_to :first1
end
