class CreateRefMany < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    # join table
    create_table :users_roles, :id => false do |t|
      t.integer :account_id
      t.integer :role_id
    end    
  end
end

