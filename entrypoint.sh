#!/bin/sh

# creating the project folder
mkdir -p /app/src/assets

# creating a phoenix project
# mix phx.new /app/src --app demo --force

# copy the package.json
cp /app/_extras/package.json /app/src/assets/

# copy the dev.exs file
cp /app/_extras/dev.exs /app/src/config/