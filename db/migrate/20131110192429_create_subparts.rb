class CreateSubparts < ActiveRecord::Migration
  def change
    create_table :subparts, id:false do |t|
      t.text :subpart_category
      t.integer :subpart_id
      t.string :subpart_name
      t.string :subpart_type
    end
    add_index :subparts, :subpart_id
  end
end
