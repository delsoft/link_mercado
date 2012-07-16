class WebMidia < ActiveRecord::Base
  attr_accessible  :url
  
  belongs_to :type_web_midia
  belongs_to :business_unit
  
  validates :url, :presence => true 
  validates :type_web_midia_id, :presence => true 
    
end
