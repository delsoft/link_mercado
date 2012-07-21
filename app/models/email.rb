class Email < ActiveRecord::Base
  attr_accessible :address, :type_contact_id, :contact_id
  
  validates :address, :presence => true
  validates :type_contact_id, :presence => true
  validates :contact_id, :presence => true
  
  belongs_to :type_contact
  belongs_to :contact
  
 
end
