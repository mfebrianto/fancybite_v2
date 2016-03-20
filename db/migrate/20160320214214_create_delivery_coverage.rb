class CreateDeliveryCoverage < ActiveRecord::Migration
  def change
    create_table :delivery_coverages do |t|
      t.string :postcode
      t.string :suburb
      t.string :drop_point
      t.timestamps
    end
  end
end
