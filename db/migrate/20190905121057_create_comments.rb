class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.integer :tour_id
      t.integer :user_id
      t.integer :category_id
      t.text :content
      t.references :tour, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
