class CreateRefMany < ActiveRecord::Migration
  def self.up
    # down

    create_table :users do |t|
      t.string :name
      t.string :troles
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    
    # join table
    create_table :roles_users, :id => false do |t|
      t.integer :user_id
      t.integer :role_id
    end        
  end
  
  def self.down  
    drop_table :users
    drop_table :roles
    drop_table :users_roles
  end
end

