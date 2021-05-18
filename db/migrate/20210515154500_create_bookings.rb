class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.float :price
      t.text :details
      t.integer :status
      t.date :start_date
      t.date :end_date
      t.references :instrument, null: false, foreign_key: true
      t.references :renter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
