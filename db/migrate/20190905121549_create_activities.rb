class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :trackable_id
      t.string :trackable_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
