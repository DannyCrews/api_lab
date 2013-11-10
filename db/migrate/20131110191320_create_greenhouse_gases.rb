class CreateGreenhouseGases < ActiveRecord::Migration
  def change
    create_table :greenhouse_gases, id:false do |t|
      t.string :GAS_NAME
      t.string :GAS_LABEL
      t.integer :GAS_CODE
      t.integer :GAS_ID
    end
    add_index :greenhouse_gases, :GAS_ID
  end
end
