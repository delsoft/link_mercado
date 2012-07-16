# encoding: utf-8

class ProductAvailable < ActiveRecord::Base
  attr_accessible :business_unit_id, :description
  
  validates :description, :presence => true, :uniqueness => {:scope => :business_unit_id, :message => "Não pode existir produtos repetidos para a mesma empresa!"}
  validates :business_unit_id, :presence => true
  
  belongs_to :business_unit
 
  
end
