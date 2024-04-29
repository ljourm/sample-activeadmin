FROM ruby:3.3.1

ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY ./Gemfile ./Gemfile.lock $APP_ROOT
RUN bundle install

COPY . .
