class CreateWeapons < ActiveRecord::Migration[6.1]
  def change
    create_table :weapons do |t|
      t.belongs_to :unit, null: false, foreign_key: true
      t.string :name
      t.integer :attacks
      t.integer :tohit
      t.integer :towound
      t.integer :rend
      t.integer :dmg
      t.timestamps
    end
  end
end
