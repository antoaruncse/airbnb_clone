class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :property_id
      t.integer :user_id
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :no_accomodates

      t.timestamps
    end
  end
end
