class InstagramWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'high'

  def perform
    Rails.logger.info 'instagram worker start'
    AdminNotificationMailer.new_instagram_tag.deliver_now if Instagram.new.number
    Rails.logger.info 'instagram worker finish'
  end
end