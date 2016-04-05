class AddIsReadyToSocials < ActiveRecord::Migration
  def change
    add_column :socials, :ready, :boolean
  end
end
