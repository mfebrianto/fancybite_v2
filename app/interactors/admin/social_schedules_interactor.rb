class Admin::SocialSchedulesInteractor

  def self.create_a_week_schedules(social)
    Fbite::Standard.a_week.each do |day|
      SocialSchedule.create(social_id: social.id, day: day)
    end
  end

end