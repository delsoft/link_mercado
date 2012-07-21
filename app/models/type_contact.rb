class TypeContact < ActiveRecord::Base
  attr_accessible :description, :is_system
  
  validates :description, :presence => true, :uniqueness => true, :well_formatted => true
  
end
