class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :addressee
      t.string :postal_code
      t.string :address
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
