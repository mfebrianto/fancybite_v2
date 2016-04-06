class Social < ActiveRecord::Base

  has_many :social_images, dependent: :destroy
  has_many :social_schedules, dependent: :destroy

  after_create :create_social_schedules

  def create_social_schedules
    Admin::SocialSchedulesInteractor.create_a_week_schedules(self)
  end
end