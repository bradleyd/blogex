defmodule Blogex.Queries do
  import Ecto.Query

  def user_query(username) do
    query = from u in Blogex.User,
            where: u.username == ^username
    Blogex.Repo.all(query)
  end
end
