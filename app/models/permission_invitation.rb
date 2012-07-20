class PermissionInvitation < ActiveRecord::Base
  attr_accessible :invitation_id, :profile_id
  
  has_one :invitation
end
