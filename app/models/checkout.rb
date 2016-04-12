class Checkout < ActiveRecord::Base

  belongs_to :customer
  belongs_to :payment

end