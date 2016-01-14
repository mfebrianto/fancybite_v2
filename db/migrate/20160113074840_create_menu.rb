class CreateMenu < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :description
      t.decimal :price
    end
  end
end
