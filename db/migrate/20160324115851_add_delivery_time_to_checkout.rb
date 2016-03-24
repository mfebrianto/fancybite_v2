class AddDeliveryTimeToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :delivery_date, :datetime
    add_column :checkouts, :delivery_time, :string
  end
end
