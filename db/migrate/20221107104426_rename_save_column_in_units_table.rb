class RenameSaveColumnInUnitsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :units, :save, :integer
    add_column :units, :unitsave, :integer
  end
end
