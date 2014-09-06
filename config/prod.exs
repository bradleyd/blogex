use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, Blogex.Router,
  port: System.get_env("PORT"),
  ssl: false,
  host: "example.com",
  cookies: true,
  session_key: "_blogex_key",
  session_secret: "U(8^%$SSQ4@YQPV_NXKOB141U)H**Q#RPK)+C3#_#)Z^B@&0E*_EPL5*GS30!W_%UYCU$7T*P"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

