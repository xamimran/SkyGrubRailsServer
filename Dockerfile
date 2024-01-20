# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.0
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base


RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /docker/app

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

CMD [ "bundle","exec", "puma", "config.ru"] # CMD ["rails","server"] # you can also write like this.
# Rails app lives here
# WORKDIR /rails

# # Install packages needed for both building gems and runtime
# RUN apt-get update -qq && \
#     apt-get install --no-install-recommends -y build-essential git libvips pkg-config curl libsqlite3-0 libvips postgresql-client

# # Set production environment
# ENV RAILS_ENV=production \
#     BUNDLE_DEPLOYMENT=1 \
#     BUNDLE_PATH=/usr/local/bundle \
#     BUNDLE_WITHOUT=development

# # Throw-away build stage to reduce size of final image
# FROM base as build

# # Install additional packages needed to build gems
# RUN apt-get install --no-install-recommends -y libpq-dev

# # Install application gems
# COPY Gemfile Gemfile.lock ./
# RUN bundle install && \
#     rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
#     bundle exec bootsnap precompile --gemfile

# # Copy application code
# COPY . .

# # Precompile bootsnap code for faster boot times
# RUN bundle exec bootsnap precompile app/ lib/

# # Set Rails environment explicitly
# ENV RAILS_ENV=production

# # Precompiling assets for production without requiring secret RAILS_MASTER_KEY
# ENV SECRET_KEY_BASE=140d660ff96132d28e7950484ec78ef6

# # Copy production credentials
# COPY config/master.key /rails/config/master.key
# COPY config/credentials.yml.enc /rails/config/credentials.yml.enc


# RUN bundle exec rails assets:precompile

# # Final stage for app image
# FROM base

# # Copy built artifacts: gems, application, and credentials
# COPY --from=build /usr/local/bundle /usr/local/bundle
# COPY --from=build /rails /rails
# COPY config/credentials/production.yml.enc /rails/config/credentials/production.yml.enc

# # Run and own only the runtime files as a non-root user for security
# RUN useradd rails --create-home --shell /bin/bash && \
#     chown -R rails:rails db log storage tmp
# USER rails:rails

# # Entrypoint prepares the database.
# ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# # Start the server by default, this can be overwritten at runtime
# EXPOSE 3000
# CMD ["./bin/rails", "server"]
