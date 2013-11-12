class CreateSector < ActiveRecord::Migration
  def change
    create_table :sectors, id:false do |t|
      t.string :sector_code
      t.string :sector_color
      t.integer :sort_order
      t.integer :sector_id
      t.string :sector_name
      t.string :sector_type
    end
    add_index :sectors, :sector_id
  end
end
