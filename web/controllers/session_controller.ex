defmodule Blogex.SessionController do
  use Phoenix.Controller
  alias Blogex.Router
  alias Blogex.User
  alias Blogex.Queries


  def new(conn, _params) do
    render conn, "new" 
  end

  ## XXX Check password attempt
  def create(conn, %{"username" => username, "password" => password}) do
    user = Queries.user_query(username)
    Blogex.Session.authenticate(password, user.password) 
    case List.first(user) do
      user when is_map(user) ->
        conn = put_session(conn, :authorized, true)
        redirect conn, Router.post_path(:index)
    _ ->
      text conn, "not authorized"
    end
  end

  def destroy(conn, _params) do
    session = get_session(conn, :authorized)
    case session do
      true ->
        conn = put_session(conn, :authorized, false)
        redirect conn, Router.user_path(:index)
      _ ->
        text conn, "Could not remove your session"
    end
  end
end
