class DeliveryTimeWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'high'

  def perform
    Rails.logger.info 'delivery time worker start'
    Rails.logger.info 'delivery time finish'
  end
end