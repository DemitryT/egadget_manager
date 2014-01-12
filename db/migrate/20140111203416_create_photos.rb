class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :gadget_id, null: false
      t.timestamps
    end

    add_index :photos, :gadget_id
  end
end
