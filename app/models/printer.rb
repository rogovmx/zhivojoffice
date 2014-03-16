class Printer < ActiveRecord::Base
  has_many :printerrash
  has_many :rashods , :through=>:printerrash
end
