class CreateBookingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_requests do |t|
      t.integer :tour_id
      t.integer :user_id
      t.boolean :status
      t.references :tour, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
