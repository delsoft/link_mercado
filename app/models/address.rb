class Address < ActiveRecord::Base
  attr_accessible :additional_address, :city_id, :district_id, :house_number, :state_id, :string, :zip_code
  
  belongs_to :state
  belongs_to :city
  belongs_to :district
  
  validates :city_id, :presence => true
  validates :state_id, :presence => true
  validates :district_id, :presence => true
  
  has_and_belongs_to_many :business_units   
end

