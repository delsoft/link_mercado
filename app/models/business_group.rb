class BusinessGroup < ActiveRecord::Base
  attr_accessible :description, :logo, :name, :owner, :web

  has_many :business_units
  
  validates :name, :presence => true, :uniqueness => true
  validates :owner, :presence => true
  
end
