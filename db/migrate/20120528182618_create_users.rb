class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email
      t.string   :password_hash
      t.string   :password_salt
      
      t.string   :activation_code
      t.datetime :activated_at
      
      t.string   :reset_password_code
      
      t.timestamps
    end
  end
end
