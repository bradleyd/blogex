defmodule Blogex.Queries do
  import Ecto.Query

  def user_query(username) do
    query = from u in Blogex.User,
            where: u.username == ^username,
            limit: 1
    results = Blogex.Repo.all(query)
    List.first(results)
  end
end
