class AddNameToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :given_name
      t.string :sure_name
    end
  end
end
