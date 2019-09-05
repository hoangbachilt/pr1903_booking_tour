class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.string :picture
      t.integer :address_id
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
