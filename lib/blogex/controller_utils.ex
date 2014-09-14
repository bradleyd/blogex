defmodule Blogex.ControllerUtils do
  use Phoenix.Controller
  alias Blogex.Router
  alias Blogex.Post
  alias Blogex.Repo


  def authenticate_user!(conn) do
    session = get_session(conn, :authorized)
    case session do
      true ->
        true
      _ ->
        redirect conn, Router.session_path(:new)
    end
  end
end
