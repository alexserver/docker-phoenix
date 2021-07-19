# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:1.12-alpine

# Installing dependencies
RUN \
    apk update && \
    apk --no-cache --update add \
    build-base \
    postgresql-client \
    git \
    wget \
    curl \
    nodejs \
    npm \
    bash \
    python2 \
    py-pip \
    inotify-tools && \
    apk add --no-cache --virtual .gyp make g++ && \
    update-ca-certificates --fresh

# Installing hex and rebar
RUN mix local.hex --force, local.rebar --force
# Installing phoenix
RUN mix archive.install hex phx_new 1.5.9 --force

ENV MIX_ENV=dev

WORKDIR /app

RUN \
    mkdir -p /app/src/assets && \
    mkdir -p /app/src/config

COPY ./_extras/package.json /app/src/assets/

COPY ./_extras/dev.exs /app/src/config/

# Starting a fake daemon to keep the server always alive.
CMD tail -f /dev/null