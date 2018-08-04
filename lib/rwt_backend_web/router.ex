defmodule RwtBackendWeb.Router do
  use RwtBackendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug RwtBackendWeb.Plugs.RequireAuth
  end

  scope "/", RwtBackendWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/user", RwtBackendWeb do
    pipe_through :api

    get "/role", UserController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RwtBackendWeb do
  #   pipe_through :api
  # end
end
