class CreateGreenhouseGases < ActiveRecord::Migration
  def change
    create_table :greenhouse_gases, id:false do |t|
      t.string :gas_name
      t.string :gas_label
      t.string :gas_code
      t.integer :gas_id
    end
    add_index :greenhouse_gases, :gas_id
  end
end
