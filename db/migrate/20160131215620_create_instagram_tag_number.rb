class CreateInstagramTagNumber < ActiveRecord::Migration
  def change
    create_table :instagram_tag_numbers do |t|
      t.integer :tag_number
      t.string :tag
      t.datetime :fetch_date
    end
  end
end
