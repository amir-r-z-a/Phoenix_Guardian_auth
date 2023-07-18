# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :authGuard,
  ecto_repos: [AuthGuard.Repo]

# Configures the endpoint
config :authGuard, AuthGuardWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: AuthGuardWeb.ErrorHTML, json: AuthGuardWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: AuthGuard.PubSub,
  live_view: [signing_salt: "8MtD41G1"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :authGuard, AuthGuard.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.2.7",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :authGuard, AuthGuard.UserManager.Guardian,
  issuer: "authGuard",
  secret_key: "EPr+S+zO3PU7kER9FB/kAjAmVhjNn7oSIc5XUquI4t27X4YmR1AqSpoLitom53eY" # put the result of the mix command above here

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
