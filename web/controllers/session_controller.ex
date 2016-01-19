defmodule Drunkscreencasts.SessionController do
  use Drunkscreencasts.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
    case Drunkscreencasts.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination.")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> Drunkscreencasts.Auth.logout()
    |> put_flash(:info, "You have been logged out.")
    |> redirect(to: page_path(conn, :index))
  end
end
