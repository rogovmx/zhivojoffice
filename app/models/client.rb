class Client < ActiveRecord::Base
  has_many :user
  has_many :clm
  has_many :manager1 ,:through=>:clm
end
