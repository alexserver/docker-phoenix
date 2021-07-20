# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:1.12

# Installing dependencies
RUN \
    apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    apt-get install -y npm && \
    apt-get install -y git &&\
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.9 --force && \
    mix local.rebar --force

# Installing hex, rebar and phoenix 1.5.9
RUN \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.9 --force && \
    mix local.rebar --force

ENV MIX_ENV=dev

WORKDIR /app

RUN \
    mkdir -p /app/data && \
    mkdir -p /app/src/config

COPY _extras/dev.exs /app/src/config/

# Starting a fake daemon to keep the server always alive.
CMD tail -f /dev/null