defmodule Blogex.Router do
  use Phoenix.Router

  scope alias: Blogex do
    get "/", WelcomeController, :index, as: :root
    get "/pages/:page", PageController, :show, as: :page
    resources "/users", UserController
    resources "/posts", PostController
    resources "/session", SessionController
  end
end
