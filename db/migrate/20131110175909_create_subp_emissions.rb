class CreateSubpEmissions < ActiveRecord::Migration
  def change
    create_table :subp_emissions, id:false do |t|
      t.string :FACILITY_ID
      t.integer :SUB_PART_ID
      t.float :CO2E_EMISSION
      t.integer :GAS_ID
      t.integer :YEAR
    end
    add_index :subp_emissions, :FACILITY_ID
    add_index :subp_emissions, :SUB_PART_ID
  end
end
