defmodule Blogex.Repo.Migrations.AlterUsersAuth do
  use Ecto.Migration

  def up do
    "ALTER TABLE users ADD COLUMN username varchar(140), ADD COLUMN password varchar(255)"
  end

  def down do
    "ALTER TABLE users DROP COLUMN username, DROP COLUMN password"
  end
end
