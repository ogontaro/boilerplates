FROM ruby:3.1.3-slim as base
ENV LANG="C.UTF-8" \
    TZ="Asia/Tokyo"
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*
ARG IMAGE_VERSION
ENV IMAGE_VERSION ${IMAGE_VERSION}

ENV APP_HOME /app
WORKDIR ${APP_HOME}


FROM base as development
COPY Gemfile* ./
RUN bundle install --jobs 4
RUN mkdir tmp log
COPY .ruby-version ./
COPY .standard.yml ./
COPY .gitignore ./
COPY ./container/entrypoint.sh /entrypoint.sh
COPY . .
ENTRYPOINT ["/entrypoint.sh"]


FROM base as production
ENV BUNDLE_FROZEN=true
RUN bundle config set without 'test development'
COPY Gemfile* ./
RUN bundle install --jobs 4
RUN mkdir tmp log
COPY lib/ ./lib/
COPY app/ ./app/
COPY bin/ ./bin/
COPY config/ ./config/
COPY db/ ./db/
COPY *.yml ./
COPY *.ru ./
COPY Rakefile ./
