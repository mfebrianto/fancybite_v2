module Admin::SocialSchedulesHelper

  def schedule_detail(social, day)
    social.social_schedules.select{|schedule| schedule.day == day}.first
  end

end