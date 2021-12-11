FROM ruby:2.7-buster

WORKDIR app

COPY lib lib
COPY server.rb .

RUN gem install nokogiri httparty grpc

ENTRYPOINT ["ruby", "server.rb"]

