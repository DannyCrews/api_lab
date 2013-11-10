class CreateSector < ActiveRecord::Migration
  def change
    create_table :sectors, id:false do |t|
      t.string :SECTOR_CODE
      t.string :SECTOR_COLOR
      t.integer :SORT_ORDER
      t.integer :SECTOR_ID
      t.string :SECTOR_NAME
      t.string :SECTOR_TYPE
    end
    add_index :sectors, :SECTOR_ID
  end
end
