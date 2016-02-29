class CreatePromo < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :name
      t.string :code
      t.timestamps
    end
  end
end
