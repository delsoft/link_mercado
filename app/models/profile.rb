class Profile < ActiveRecord::Base
  attr_accessible :description
  
  has_many :permission
end
