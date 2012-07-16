class ProfessionalActivity < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :business_units
  
  validates :name, :presence => true, :uniqueness => true   
  #validates :name, :presence => true   
  
end

