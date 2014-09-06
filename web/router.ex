defmodule Blogex.Router do
  use Phoenix.Router

  get "/", Blogex.PageController, :index, as: :pages

end
