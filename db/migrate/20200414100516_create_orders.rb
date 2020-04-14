class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :total_price
      t.string :postage
      t.string :addressee
      t.string :delivery_postcode
      t.string :delivery_address
      t.integer :payment
      t.integer :order_status
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
