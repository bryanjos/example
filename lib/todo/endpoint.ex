defmodule Todo.Endpoint do
  use Phoenix.Endpoint, otp_app: :todo

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :todo,
    only: ~w(css images js jspm_packages config.js favicon.ico robots.txt)

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

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

  plug :router, Todo.Router
end
