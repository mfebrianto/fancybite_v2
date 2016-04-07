class CreateSocialSchedule < ActiveRecord::Migration
  def change
    create_table :social_schedules do |t|
      t.string :social_id
      t.string :day
      t.boolean :active
      t.integer :time
    end
  end
end
