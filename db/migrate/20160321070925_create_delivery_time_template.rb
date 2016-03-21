class CreateDeliveryTimeTemplate < ActiveRecord::Migration
  def change
    create_table :delivery_time_templates do |t|
      t.string :day
      t.boolean :morning
      t.boolean :afternoon
      t.boolean :evening
    end
  end
end
