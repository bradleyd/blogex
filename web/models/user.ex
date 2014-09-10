defmodule Blogex.User do
  use Ecto.Model

  validate user,
  content: present()

  schema "users" do
    field :content, :string
    field :username, :string
    field :password, :string
  end 

end
