class AddChemicalStructureIdToChemicalStructure < ActiveRecord::Migration[5.2]
  def change
    add_column :chemical_structures, :chemical_structure_id, :integer
  end
end
