class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      # implicit role_id binds to role_id of roles_users join table
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :roles
  end

end