namespace :instagram do
  task tags: :environment do
    p '>>>>1'
    InstagramWorker.perform_async
  end
end
