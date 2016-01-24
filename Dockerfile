FROM ruby:2.2.4

MAINTAINER chris@chris-kelly.net

ADD . /code
WORKDIR /code

RUN bundle install --deployment

RUN groupadd -r ruby && useradd -r -g ruby ruby
USER ruby

CMD bundle exec puma -p 8080
