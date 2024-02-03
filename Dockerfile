# syntax=docker/dockerfile:1
FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client git

WORKDIR /quake_reports
COPY Gemfile /quake_reports/Gemfile
COPY Gemfile.lock /quake_reports/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
