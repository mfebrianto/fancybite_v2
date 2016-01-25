class AlterMenusPriceDecimal < ActiveRecord::Migration
  def change
    change_column :menus, :price, :decimal, :precision => 10, :scale => 2
  end
end
