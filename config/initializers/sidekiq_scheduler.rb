require 'sidekiq/scheduler'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.join(Rails.root, 'config', 'fancybite_scheduler.yml'))
    Sidekiq::Scheduler.enabled = true
    Sidekiq::Scheduler.reload_schedule!
  end
end