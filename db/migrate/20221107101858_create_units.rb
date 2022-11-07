class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :unitsize
      t.integer :wounds
      t.integer :save
      t.integer :bravery
      t.string :img
      t.timestamps
    end
  end
end
