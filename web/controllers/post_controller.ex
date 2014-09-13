defmodule Blogex.PostController do
  use Phoenix.Controller
  alias Blogex.Router
  alias Blogex.Post
  alias Blogex.Repo


  def index(conn, _params) do
    session = get_session(conn, :authorized)
    case session do
      true ->
        render conn, "index", posts: Blogex.Repo.all(Post)
      _ ->
        text conn, "Not authorized"
    end
  end

  def new(conn, _params) do
    render conn, "new"
  end
  
  def edit(conn, %{"id" => id}) do
    post = Repo.get(Post, id)
    render conn, "edit", post: post
  end

  def update(conn,  %{ "id" => id, "post" => params }) do
    post = Repo.get(Post, id)
    post = %{post| title: params["title"], content: params["content"]}
    case Post.validate(post) do
      [] -> 
        Repo.update(post)
        redirect conn, Router.post_path(:show, post.id)
      errors ->
        render conn, "edit", post: post, errors: errors
    end 
  end

  def create(conn, %{ "post" => %{ "title" => title, "content" => content} }) do
    post = %Post{ title: title, content: content}
    case Post.validate(post) do
      [] ->
        Repo.insert(post)
        redirect conn, Router.post_path(:show, post.id)
      errors ->
        render conn, "new", post: post, errors: errors
    end
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get(Post, id)
    render conn, "show", post: post
  end

  def destroy(conn, %{"id" => id}) do
    case Repo.get(Post, id) do
      post when is_map(post) ->
        Repo.delete(post)
        redirect conn, Router.post_path(:index)
      _ ->
        text conn, "could not find post to delete"
    end
  end
    

end
