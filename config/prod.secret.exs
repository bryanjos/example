use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :todo, Todo.Endpoint,
  secret_key_base: "cre/44Y2Z1rJNCk3Sw6vCP4rRolTVxGxjhwvMnnkBIDBBQRhPMJZ8C2sK2l4D85U"

# Configure your database
config :todo, Todo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "todo_prod"
