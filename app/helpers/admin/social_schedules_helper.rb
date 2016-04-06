module Admin::SocialSchedulesHelper

  def show_active(social, day)
    if social.social_schedules.present?
      return 'active'
    else
      return 'not present'
    end
  end

  def show_time(social, day)
    if social.social_schedules.present?
      return 'active'
    else
      return 'not present'
    end
  end

end