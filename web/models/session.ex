defmodule Blogex.Session do
  def hash_password(password) do
    { :ok, salt } = :bcrypt.gen_salt
    :bcrypt.hashpw(password, salt)
  end

  def authenticate(attempt, password) do
    {ok, password} = :bcrypt.hashpw(attempt, password)
  end
end
