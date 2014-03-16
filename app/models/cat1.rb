class Cat1 < ActiveRecord::Base

 belongs_to :tov3
 belongs_to :collection

 has_many :collection
 has_many :cat1img
 has_many :set_item
 has_many :analog

 has_one :bcat1
 
 named_scope :visible, :conditions => 'vis  = true' 
 named_scope :vis_spb, :conditions => 'spb  = true'
 named_scope :vis_msk, :conditions => 'msk  = true'
end
