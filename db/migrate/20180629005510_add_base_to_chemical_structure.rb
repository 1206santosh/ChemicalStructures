class AddBaseToChemicalStructure < ActiveRecord::Migration[5.2]
  def change
    add_column :chemical_structures, :base, :boolean
  end
end
