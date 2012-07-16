class District < ActiveRecord::Base
  attr_accessible :city_id, :name
  
  validates :name, :presence => true, :uniqueness => {:scope => :city_id}
  validates :city_id, :presence => true
  
  belongs_to :city
  has_many :addresses
  
  
end
