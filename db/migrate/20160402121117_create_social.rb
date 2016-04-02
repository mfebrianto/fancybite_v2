class CreateSocial < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :description
      t.timestamps
    end
  end
end
