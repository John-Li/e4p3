defmodule Gallow.Views.Helpers.GameStateHelper do

  import Phoenix.HTML, only: [ raw: 1 ]

  @responses %{
    :won => { :info, "You Won!" },
    :lost => { :danger, "You Lost!" },
    :good_guess => { :info, "Good guess!" },
    :bad_guess => { :warning, "Bad guess!" },
    :already_used => { :info, "You already used that!" },
  }

  def game_state(state) do
    @responses[state]
    |> alert()
  end

  def alert(nil), do: ""
  def alert({class, message}) do
    """
    <div class="alert alert-#{class}">
      #{message}
    </div>
    """
    |> raw
  end

end
