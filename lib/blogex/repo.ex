defmodule Blogex.Repo do
    use Ecto.Repo, adapter: Ecto.Adapters.Postgres

    def conf do
      user = System.get_env("BLOGEX_USERNAME")
      pass = System.get_env("BLOGEX_PASSWORD")
      parse_url "ecto://#{user}:#{pass}@localhost/blogex"
    end

    def priv do
      app_dir(:blogex, "priv/repo")
    end
end
