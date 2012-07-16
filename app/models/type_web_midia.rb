class TypeWebMidia < ActiveRecord::Base
  attr_accessible :logo, :name
  
  belongs_to :web_midia
  validates :name, :presence => true, :uniqueness => true
  
end
