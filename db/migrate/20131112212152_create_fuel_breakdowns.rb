class CreateFuelBreakdowns < ActiveRecord::Migration
  def change
    create_table :fuel_breakdowns do |t|
      t.integer :year
      t.string :state_abbr
      t.string :prod_type
      t.string :fuel_type
      t.string :generation
    end
  end
end
