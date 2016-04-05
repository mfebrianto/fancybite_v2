class Social < ActiveRecord::Base

  has_many :social_images, dependent: :destroy

end