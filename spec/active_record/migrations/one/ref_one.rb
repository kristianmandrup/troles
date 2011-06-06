class CreateRefOne < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.integer :role_id # a user can have ONE role
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
    drop_table :roles
  end  
end

