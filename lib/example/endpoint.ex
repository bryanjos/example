defmodule Example.Endpoint do
  use Phoenix.Endpoint, otp_app: :example

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :example,
    only: ~w(css images js jspm_packages config.js favicon.ico robots.txt)

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_example_key",
    signing_salt: "4M7yh9ts",
    encryption_salt: "1nASQZCX"

  plug :router, Example.Router
end
