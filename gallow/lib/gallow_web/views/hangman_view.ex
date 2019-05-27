defmodule GallowWeb.HangmanView do
  use GallowWeb, :view

  import Gallow.Views.Helpers.GameStateHelper

  def game_over?(%{game_state: game_state }) do
    game_state in [ :won, :lost ]
  end

  def new_game_button() do
    button("New Game", to: "/hangman")
  end

  def turn(left, target) when target >= left do
    "opacity: 1"
  end

  def turn(_left, _target) do
    "opacity: 0.1"
  end

  def format_word(letters) do
    letters
    |> Enum.join(" ")
  end
end
