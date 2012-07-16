class City < ActiveRecord::Base
  attr_accessible :name, :state_id
  
  belongs_to :state
  has_many :addresses
  has_many :districts
  
  
  validates :name, :presence => true, :uniqueness => { :scope => :state_id, :message => "so pode existir uma cidade por estado" }
  validates :state_id, :presence => true
  
end
