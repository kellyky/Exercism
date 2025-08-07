defmodule TwoFer do
  def two_fer(name \\ "you")
  def two_fer(name) when is_bitstring(name), do: "One for #{name}, one for me."
  def two_fer(_name), do: raise FunctionClauseError
end
