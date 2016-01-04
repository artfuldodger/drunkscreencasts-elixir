defmodule Drunkscreencasts.PageController do
  use Drunkscreencasts.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
