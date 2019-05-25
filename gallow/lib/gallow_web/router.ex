defmodule GallowWeb.Router do
  use GallowWeb, :router

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

  scope "/hangman", GallowWeb do
    pipe_through :browser

    get "/",  HangmanController, :new_game
    post "/", HangmanController, :create_game
    put "/",  HangmanController, :make_move
  end

  # Other scopes may use custom stacks.
  # scope "/api", GallowWeb do
  #   pipe_through :api
  # end
end
