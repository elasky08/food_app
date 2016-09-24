class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :apartment_number
      t.integer :street_number
      t.string :street
      t.string :city
      t.string :state
      t.integer :telephone

      t.timestamps
    end
  end
end
