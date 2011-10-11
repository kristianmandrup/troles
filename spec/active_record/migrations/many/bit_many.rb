class CreateBitMany < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.integer :troles
      t.timestamps
    end
  end
end
    