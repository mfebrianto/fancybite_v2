class Payment < ActiveRecord::Base

  has_one :checkout

end
