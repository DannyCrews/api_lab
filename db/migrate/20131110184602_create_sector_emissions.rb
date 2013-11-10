class CreateSectorEmissions < ActiveRecord::Migration
  def change
    create_table :sector_emissions, id:false do |t|
      t.float :CO2E_EMISSION
      t.integer :FACILITY_ID
      t.integer :YEAR
      t.integer :SECTOR_ID
      t.integer :SUBSECTOR_ID
      t.integer :GAS_ID
    end
    add_index :sector_emissions, :FACILITY_ID
    add_index :sector_emissions, :GAS_ID
    add_index :sector_emissions, :SECTOR_ID
  end
end
