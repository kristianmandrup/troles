class CreateRefManyUsers < ActiveRecord::Migration
  def self.up
    create_table :ref_many_users do |t|
      # implicit user_id binds to user_id of roles_users join table      
      t.string :name
      t.timestamps
    end

    # join table
    create_table :ref_many_users_roles, :id => false do |t|
      t.integer :ref_many_user_id
      t.integer :role_id
    end
  end
  
  def self.down
    drop_table :ref_many_users
    drop_table :ref_many_users_roles
  end
end