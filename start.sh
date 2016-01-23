echo "*** STARTING RAILS APP ***"
ls tmp/pids/server.pid
rm tmp/pids/server.pid
bundle install
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake db:seed
bundle exec rake log:clear
rails s
