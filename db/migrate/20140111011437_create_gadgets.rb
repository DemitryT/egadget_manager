class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :name, null: false
      t.string :manufacturer
      t.integer :quantity, null: false, default: 1
      t.datetime :date_purchased
      t.integer :user_id

      t.timestamps
    end

    add_index :gadgets, :user_id
  end
end
