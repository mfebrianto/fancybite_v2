class CreateFeatureControl < ActiveRecord::Migration
  def change
    create_table :feature_controls do |t|
      t.string :name
      t.string :description
      t.boolean :disabled
    end
  end
end
