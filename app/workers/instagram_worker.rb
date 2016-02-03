class InstagramWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform
    Instagram.new
  end
end