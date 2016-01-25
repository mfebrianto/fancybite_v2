class CreateFeatured < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
    end

    add_attachment :features, :picture_large
    add_attachment :features, :picture_small
  end
end
