echo "*** STARTING RAILS APP ***"
ls tmp/pids/server.pid
rm tmp/pids/server.pid
bundle install
#rake db:create
#rake db:migrate
#rake db:seed
#bundle exec rake log:clear
rails s
