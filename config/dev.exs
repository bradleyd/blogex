use Mix.Config

config :phoenix, Blogex.Router,
  port: System.get_env("PORT") || 4000,
  ssl: false,
  host: "localhost",
  cookies: true,
  session_key: "_blogex_key",
  session_secret: "U(8^%$SSQ4@YQPV_NXKOB141U)H**Q#RPK)+C3#_#)Z^B@&0E*_EPL5*GS30!W_%UYCU$7T*P",
  debug_errors: true

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


