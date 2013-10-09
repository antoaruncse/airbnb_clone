class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :home_type
      t.string :room_type
      t.integer :accomodates
      t.string :city
      t.string :address
      t.integer :price_night
      t.string :title

      t.timestamps
    end
  end
end
