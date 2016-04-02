class CreateSocialImages < ActiveRecord::Migration
  def change
    create_table :social_images do |t|
      t.string :social_id
      t.string :name
      t.timestamps
    end

    add_attachment :social_images, :picture
  end
end
