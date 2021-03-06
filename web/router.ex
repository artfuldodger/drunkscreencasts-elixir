defmodule Drunkscreencasts.Router do
  use Drunkscreencasts.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Drunkscreencasts.Auth, repo: Drunkscreencasts.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Drunkscreencasts do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/videos", VideoController, only: [:index, :show]

    get "/", PageController, :index
  end

  scope "/manage", Drunkscreencasts do
    pipe_through [:browser, :authenticate_user]

    resources "/videos", VideoController, only: [:new, :create, :edit, :update, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Drunkscreencasts do
  #   pipe_through :api
  # end
end
