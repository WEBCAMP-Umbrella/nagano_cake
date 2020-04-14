class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :name
      t.string :price
      t.integer :making_status
      t.integer :quantity
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
