class Phone < ActiveRecord::Base
  attr_accessible :area_code, :extension, :number, :type_contact_id
  
  validates :extension, :numericality => {:only_integer => true, :allow_blank => true }
  
  validates :area_code, :numericality => {:only_integer => true }, :well_formatted => {:right_just => {:lenght => 3 } }
  
  validates :number, :presence => true, :numericality => {:only_integer => true }, 
    :length => { 
      :minimum => 8, 
      :maximum => 20,
      :too_short => "deve haver no minimo %{count} digitos",
      :too_long => "deve haver no maximo %{count} digitos" 
    }
    
  validates :type_contact_id, :presence => true
  
  belongs_to :type_contact
  belongs_to :contact
  
   
end
