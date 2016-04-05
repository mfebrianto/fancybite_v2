class Social < ActiveRecord::Base

  has_many :social_images, dependent: :destroy
  has_many :social_schedules, dependent: :destroy

end