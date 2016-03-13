class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.string :basket_id
      t.string :menu_id
      t.timestamps
    end
  end
end
