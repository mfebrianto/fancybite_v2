class InstagramWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform
    Rails.logger.info 'instagram worker start'
    Instagram.new
    Rails.logger.info 'instagram worker finish'
  end
end