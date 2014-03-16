class SaleAction < ActiveRecord::Base
  validates_presence_of  :city_id
  belongs_to :city
end
