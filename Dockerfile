FROM ruby:2.3.0
MAINTAINER Michael Febrianto "michaelfebrianto@gmail.com"

RUN apt-get update

# install the prerequisite patches here so that rvm will install under non-root account. 
RUN apt-get install -y curl patch gawk g++ gcc make libc6-dev patch libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client vim
RUN apt-get --assume-yes install libmysqlclient-dev
RUN npm install -g phantomjs

RUN mkdir /fancybite

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /fancybite
WORKDIR /fancybite
ADD start.sh start.sh
RUN chmod +x /fancybite/start.sh

WORKDIR /fancybite

RUN more /fancybite/tmp/pids/server.pid

EXPOSE 3000

CMD /fancybite/start.sh