class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :ip
      t.string :checkout_id
      t.string :express_token
      t.string :express_payer_id

      t.timestamps null: false
    end
  end
end
