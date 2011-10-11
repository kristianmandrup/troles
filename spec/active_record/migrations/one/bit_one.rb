class CreateBitOne < ActiveRecord::Migration
  def change        
    create_table :users do |t|
      t.string :name
      t.boolean :trole
      t.timestamps
    end
  end
end

