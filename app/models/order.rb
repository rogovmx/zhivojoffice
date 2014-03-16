class Order < ActiveRecord::Base
  has_many :lineitem
  belongs_to :user
end
