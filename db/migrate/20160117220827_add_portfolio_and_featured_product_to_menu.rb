class AddPortfolioAndFeaturedProductToMenu < ActiveRecord::Migration
  def change
    change_table :menus do |t|
      t.boolean :portfolio
      t.boolean :part_number
    end
  end
end
