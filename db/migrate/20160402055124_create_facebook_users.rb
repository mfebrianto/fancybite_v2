class CreateFacebookUsers < ActiveRecord::Migration
  def change
    create_table :facebook_users do |t|
      t.boolean :expires
      t.decimal :expires_at
      t.string :token
      t.string :email
      t.string :image
      t.string :name
      t.string :uid
      t.string :user_id
      t.timestamps
    end
  end
end
