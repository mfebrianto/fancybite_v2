class FacebookShareWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'high'

  def perform
    Rails.logger.info 'facebook worker start'

    social_schedule = SocialSchedule.where("active=? AND day=? AND time=?",
                                           true,
                                           Time.now.strftime('%A').downcase,
                                           Time.now.strftime('%H').to_i).first
    if social_schedule
      image_file = social_schedule.social.social_images.last.picture.path
      Hashtag::FacebookShareInteractor.post_to_group(social_schedule.social.description, image_file)
    end

    Rails.logger.info 'facebook worker finish'
  end
end