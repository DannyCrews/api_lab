class CreateEmitters < ActiveRecord::Migration
  def change
    create_table :emitters do |t|
      t.integer :facility_id
      t.string :facility_name
      t.float :latitude
      t.float :longitude
      t.string :state
      t.string :state_name
      t.string :county
      t.string :ch4_emissions_co2e
      t.string :fuel_type
      t.string :fuel_type_blend
      t.string :fuel_type_other
      t.integer :reporting_year
      t.string :ghg_name
      t.float :ghg_quantity
      t.integer :county_id
    end
      add_index :emitters, :facility_id
      add_index :emitters, :county_id
  end
end
