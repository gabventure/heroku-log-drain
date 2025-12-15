FROM ruby:3.3

WORKDIR /app

RUN apt-get update -qq && apt-get install -y nodejs

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]