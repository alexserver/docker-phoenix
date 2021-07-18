## build
dc build [container]

## up
dc up -d [db, phoenix]

## get into shell
d exec -it phoenix sh

## after creating a project in phoenix
```
We are almost there! The following steps are missing:

    $ cd discuss
    $ cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```