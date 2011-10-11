class CreateStringOne < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :trole
      t.timestamps
    end
  end
end

