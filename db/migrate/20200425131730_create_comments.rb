class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :customer, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
