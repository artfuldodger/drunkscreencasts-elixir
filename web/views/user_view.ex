defmodule Drunkscreencasts.UserView do
  use Drunkscreencasts.Web, :view
  alias Drunkscreencasts.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
