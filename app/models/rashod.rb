class Rashod < ActiveRecord::Base
  has_many :printerrash
  has_many :printer , :through=>:printerrash
end
