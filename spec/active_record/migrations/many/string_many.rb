class CreateStringMany < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :troles
      t.timestamps
    end
  end
end

