class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :non_taxed_price
      t.string :image_id
      t.integer :sale_status, default: 0
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
