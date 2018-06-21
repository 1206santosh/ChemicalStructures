class CreateChemicalStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :chemical_structures do |t|
      t.string :name
      t.text :marvin_structure
      t.text :structure_bs64
      t.string :ref_id

      t.timestamps
    end
  end
end
