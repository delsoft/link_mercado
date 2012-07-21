class Contact < ActiveRecord::Base
  attr_accessible :name, :business_unit_id
  
  validates :name, :presence => true, :uniqueness => { :scoped => [:business_unit_id] }, :well_formatted => true
  validates :business_unit_id, :presence => true
  
  belongs_to :business_unit

  has_many :emails
  has_many :phones
  
end
