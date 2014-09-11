defmodule Blogex.UserController do
  use Phoenix.Controller
  alias Blogex.Router
  alias Blogex.User
  alias Blogex.Session


  def index(conn, _params) do
    render conn, "index", users: Blogex.Repo.all(User)
  end

  def show(conn, %{"id" => id}) do
    case Blogex.Repo.get(User, id) do
      user when is_map(user) ->
        render conn, "show", user: user
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end

  def new(conn, _params) do
    render conn, "new" 
  end

  def edit(conn, %{"id" => id}) do
    case Blogex.Repo.get(User, id) do
      user when is_map(user) ->
        render conn, "edit", user: user
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end

  def update(conn, %{"id" => id, "user" => params}) do
    user = Blogex.Repo.get(User, id)
    user = %{user | content: params["content"]}

    case User.validate(user) do
      [] ->
        Blogex.Repo.update(user)
        redirect conn, Router.user_path(:show, user.id)
      errors ->
        json conn, errors: errors
    end
  end

  def create(conn, %{"user" => %{"username" => username, "password" => password, "content" => content}}) do
    {:ok, pass } = Session.hash_password(password)
    user = %User{username: username, password: to_string(pass), content: content}
    case User.validate(user) do
      [] ->
        user = Blogex.Repo.insert(user)
        render conn, "show", user: user
      errors ->
        render conn, "new", user: user, errors: errors
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
