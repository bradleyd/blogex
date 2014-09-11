defmodule Blogex.PostController do
  use Phoenix.Controller
  alias Blogex.Router
  alias Blogex.Post


  def index(conn, _params) do
    session = get_session(conn, :authorized)
    #text conn, session
    IO.inspect session
    case session do
      true ->
        render conn, "index", posts: Blogex.Repo.all(Post)
      _ ->
        text conn, "Not authorized"
    end
  end
  
  def show(conn, %{"post" => post}) do
    render conn, "show", post: post
  end

end
