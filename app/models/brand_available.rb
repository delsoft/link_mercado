# encoding: utf-8

class BrandAvailable < ActiveRecord::Base
  attr_accessible :business_unit_id, :description
  validates :description, :presence => true, :uniqueness => {:scope => :business_unit_id, :message => "Não pode existir marcas repetidas para a mesma empresa!"}
  validates :business_unit_id, :presence => true
  
  belongs_to :business_unit
end
