defmodule Blogex.PageController do
  use Phoenix.Controller

  def show(conn, %{"page" => "unauthorized"}) do
    conn
    |> assign_layout(:none)
    |> render "unauthorized"
  end

  def show(conn, %{"page" => page}) do
    render conn, "show", page: page
  end

end
