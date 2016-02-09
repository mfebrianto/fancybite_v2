echo "*** STARTING RAILS APP ***"
ls tmp/pids/server.pid
rm tmp/pids/server.pid
bundle install
bundle exec rake log:clear
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake db:seed
RAILS_ENV=production rake assets:precompile
#bundle exec rake log:clear

RAILS_ENV=production bundle exec sidekiq -q high -L log/sidekiq.log &
RAILS_ENV=production rails server -p 3000 -b '0.0.0.0' # rails s