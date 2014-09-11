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
    case List.first(user) do
      user when is_map(user) ->
        conn = put_session(conn, :authorized, true)
        redirect conn, Router.post_path(:index)
    _ ->
      text conn, "not authorized"
    end
  end

  def destroy(conn, _params) do
    user = Blogex.Repo.get(User, id)

    case List.first(user) do
      user when is_map(user) ->
        session = get_session(conn, :authorized)
        if session do
          conn = put_session(conn, :authorized, false)
          redirect conn, Router.user_path(:index)
        end
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end
end
