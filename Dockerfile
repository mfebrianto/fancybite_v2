FROM ruby:2.3.0
MAINTAINER Michael Febrianto "michaelfebrianto@gmail.com"

RUN apt-get update

# install the prerequisite patches here so that rvm will install under non-root account. 
RUN apt-get install -y curl patch gawk g++ gcc make libc6-dev patch libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client vim
RUN apt-get install libmysqlclient-dev
RUN npm install -g phantomjs

RUN mkdir /fancybite

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

RUN SECRET_KEY_BASE=c4c444c016046dd259ad1953c78866e954f804c7d1d75e992177688484f8ab5f8aa59d4848b0d4fa12b0d404b77867dab94588fe55b1d038be75d1ede251d1d1

ADD . /fancybite
WORKDIR /fancybite
ADD start.sh start.sh
RUN chmod +x /fancybite/start.sh
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace

WORKDIR /fancybite

RUN more /fancybite/tmp/pids/server.pid

EXPOSE 3000

CMD /fancybite/start.sh
