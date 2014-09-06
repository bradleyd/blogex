# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, Blogex.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_blogex_key",
  session_secret: "U(8^%$SSQ4@YQPV_NXKOB141U)H**Q#RPK)+C3#_#)Z^B@&0E*_EPL5*GS30!W_%UYCU$7T*P",
  catch_errors: true,
  debug_errors: false,
  error_controller: Blogex.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
