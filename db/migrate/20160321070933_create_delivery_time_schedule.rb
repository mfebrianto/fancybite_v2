class CreateDeliveryTimeSchedule < ActiveRecord::Migration
  def change
    create_table :delivery_time_schedules do |t|
      t.datetime :schedule_date
      t.boolean :morning
      t.string :morning_postcode
      t.boolean :afternoon
      t.string :afternoon_postcode
      t.boolean :evening
      t.string :evening_postcode
    end
  end
end
