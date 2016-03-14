class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :shopping_cart_id
      t.string :customer_id
      t.string :user_id
      t.string :payment_id
      t.timestamps
    end
  end
end
