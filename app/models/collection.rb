class Collection < ActiveRecord::Base
  belongs_to :cat1
  has_many :cat1
end
