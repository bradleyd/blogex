defmodule Blogex.WelcomeController do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, "index"
  end

end
