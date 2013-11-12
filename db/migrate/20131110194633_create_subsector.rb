class CreateSubsector < ActiveRecord::Migration
  def change
    create_table :subsectors, id:false do |t|
      t.integer :subsector_id
      t.string :subsector_name
      t.string :subsector_desc
      t.integer :sector_id
      t.integer :subsector_order
    end
    add_index :subsectors, :sector_id
  end
end
