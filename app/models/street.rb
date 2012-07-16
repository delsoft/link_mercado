class Street < ActiveRecord::Base
  attr_accessible :additional_data, :city_id, :district_id, :name, :number, :state_id, :zip_code
end
