FROM ruby:2.5

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

RUN gem install bundler jekyll
COPY Gemfile Gemfile.lock ./
RUN bundle install

VOLUME /usr/src/app

EXPOSE 4000

COPY . .

CMD ["bundle", "exec", "jekyll", "serve"]
