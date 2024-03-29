class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :mobile
      t.string :address
      t.string :country
      t.string :remember_token

      t.timestamps
    end
  end
end
