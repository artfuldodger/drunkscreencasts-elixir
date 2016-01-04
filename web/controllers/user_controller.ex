defmodule Drunkscreencasts.UserController do
  use Drunkscreencasts.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Drunkscreencasts.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Drunkscreencasts.User, id)
    render conn, "show.html", user: user
  end
end
