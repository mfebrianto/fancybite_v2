class AddSessionIdToBaskets < ActiveRecord::Migration
  def change
    add_column :baskets, :session_id, :string
  end
end
