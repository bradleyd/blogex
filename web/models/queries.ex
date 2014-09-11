defmodule Blogex.Queries do
  import Ecto.Query

  def user_query(username) do
    query = from u in Blogex.User,
            where: u.username == ^username,
            limit: 1
    Blogex.Repo.all(query)
  end
end
