class Phone < ActiveRecord::Base
  attr_accessible :area_code, :extension, :number, :type_contact_id
end
