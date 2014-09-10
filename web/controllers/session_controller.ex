defmodule Blogex.SessionController do
  use Phoenix.Controller
  alias Blogex.Router
  alias Blogex.User
  alias Blogex.Queries


  def new(conn, _params) do
    render conn, "new" 
  end

  def create(conn, %{"username" => username, "password" => password}) do
    user = Queries.user_query(username)
    case user do
      user when is_map(user) ->
        redirect conn, Router.post_path(:index)
    _ ->
      text conn, "not authorized"
    end
  end

  def destroy(conn, %{"id" => id}) do
    user = Blogex.Repo.get(User, id)

    case user do
      user when is_map(user) ->
        Blogex.Repo.delete(user)
        redirect conn, Router.user_path(:index)
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end
end
