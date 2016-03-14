class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :given_name
      t.string :sure_name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :suburb
      t.string :city
      t.string :postcode
      t.timestamps
    end
  end
end
