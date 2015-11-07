FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /sahara
RUN mkdir /sahara/tmp
WORKDIR /sahara
ADD . /sahara
RUN bundle install -j4 --without development test
EXPOSE 3000
CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
