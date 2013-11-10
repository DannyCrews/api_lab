class CreateSubsector < ActiveRecord::Migration
  def change
    create_table :subsectors, id:false do |t|
      t.integer :SUBSECTOR_ID
      t.string :SUBSECTOR_NAME
      t.string :SUBSECTOR_DESC
      t.integer :SECTOR_ID
      t.integer :SUBSECTOR_ORDER
    end
    add_index :subsectors, :SECTOR_ID
  end
end
