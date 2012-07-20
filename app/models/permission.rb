class Permission < ActiveRecord::Base
  attr_accessible :company_id, :profile_id
  
  belongs_to :profile
  belongs_to :company
  belongs_to :user
end
