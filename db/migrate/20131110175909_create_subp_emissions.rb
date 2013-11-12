class CreateSubpEmissions < ActiveRecord::Migration
  def change
    create_table :subp_emissions, id:false do |t|
      t.string :facility_id
      t.integer :subpart_id
      t.float :co2e_emission
      t.integer :gas_id
      t.integer :year
    end
    add_index :subp_emissions, :facility_id
    add_index :subp_emissions, :subpart_id
  end
end
