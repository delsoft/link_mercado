class CreatePermissionInvitations < ActiveRecord::Migration
  def change
    create_table :permission_invitations do |t|
      t.integer :invitation_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
