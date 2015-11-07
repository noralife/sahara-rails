FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /sahara
WORKDIR /sahara
ADD . /sahara
RUN bundle install
