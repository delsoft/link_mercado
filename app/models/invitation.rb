class Invitation < ActiveRecord::Base
  attr_accessible :guest_id, :user_id
  
  has_many :permission_invitation
  belongs_to :user
end
