require IEx
defmodule HighScore do
  @initial_score 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @initial_score) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, 0)
  end

  def update_score(scores, name, score) do
    original_score = Map.get(scores, name) || 0
    Map.put(scores, name, score + original_score)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
