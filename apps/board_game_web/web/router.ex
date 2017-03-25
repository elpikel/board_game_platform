defmodule BoardGameWeb.Router do
  use BoardGameWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BoardGameWeb do
    pipe_through :browser # Use the default browser stack

    get "/", ProductController, :index
    #post "/search", ProductController, :search
  end

  # Other scopes may use custom stacks.
  # scope "/api", BoardGameWeb do
  #   pipe_through :api
  # end
end
