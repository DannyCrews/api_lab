class CreateSectorEmissions < ActiveRecord::Migration
  def change
    create_table :sector_emissions, id:false do |t|
      t.float :co2e_emission
      t.integer :facility_id
      t.integer :year
      t.integer :sector_id
      t.integer :subsector_id
      t.integer :gas_id
    end
    add_index :sector_emissions, :facility_id
    add_index :sector_emissions, :gas_id
    add_index :sector_emissions, :sector_id
  end
end
