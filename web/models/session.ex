defmodule Blogex.Session do
  def hash_password(password) do
    { :ok, salt } = :bcrypt.gen_salt
    :bcrypt.hashpw(password, salt)
  end

  def authenticate(attempt, password) do
    char_attempt = to_char_list(attempt)
    char_password = to_char_list(password)
    { :ok, char_password} == :bcrypt.hashpw(char_attempt, char_password)
  end
end
