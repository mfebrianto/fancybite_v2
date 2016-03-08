class AddNumberOfItemToBasketItems < ActiveRecord::Migration
  def change
    add_column :basket_items, :number_of_item, :integer, default: 1
  end
end
