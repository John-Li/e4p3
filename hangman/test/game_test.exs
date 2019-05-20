defmodule GameTest do
  use ExUnit.Case
  
  alias Hangman.Game

  test "new_game() returns structure" do
    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "each element of the letters list is a lower-case ASCII character (“a” to “z”)" do
    game = Game.new_game

    Enum.each(game.letters, fn letter -> assert letter =~ ~r/[a-z]/ end )
  end

  test "state isn't changed when game is :won or :lost" do
    for state <- [:won, :lost] do
      game = Game.new_game() |> Map.put(:game_state, state)
      assert { ^game, _} = Game.make_move(game, "x") 
    end
  end

  test "first occurence of letter is not used" do
    game = Game.new_game
    { game, _tally } = Game.make_move(game, "x")
    assert game.game_state != :already_used
  end

end
