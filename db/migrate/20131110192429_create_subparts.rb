class CreateSubparts < ActiveRecord::Migration
  def change
    create_table :subparts, id:false do |t|
      t.text :SUBPART_CATEGORY
      t.integer :SUBPART_ID
      t.string :SUBPART_NAME
      t.string :SUBPART_TYPE
    end
    add_index :subparts, :SUBPART_ID
  end
end
