class AddStructureTypeToChemicalStructure < ActiveRecord::Migration[5.2]
  def change
    add_column :chemical_structures, :structure_type, :string
  end
end
