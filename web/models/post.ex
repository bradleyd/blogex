defmodule Blogex.Post do
  use Ecto.Model

  validate post, content: present()

  schema "posts" do
    field :title, :string
    field :content, :string
  end 
end
