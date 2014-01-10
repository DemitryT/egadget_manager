class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string   :name, null: false
      t.integer  :quantity, null: false, default: 1
      t.datetime :date_purchased

      t.timestamps
    end
  end
end
