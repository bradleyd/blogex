defmodule Blogex.PostController do
  use Phoenix.Controller
  alias Blogex.Router
  alias Blogex.Post


  def index(conn, _params) do
    render conn, "index", posts: Blogex.Repo.all(Post)
  end
  
  def show(conn, %{"post" => post}) do
    render conn, "show", post: post
  end

end
