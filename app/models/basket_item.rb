class BasketItem < ActiveRecord::Base

  belongs_to :basket
  belongs_to :menu

end