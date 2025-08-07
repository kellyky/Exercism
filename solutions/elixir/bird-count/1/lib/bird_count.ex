defmodule BirdCount do
  def today(list) do
    Enum.at(list, 0)
  end

  def increment_day_count(list) do
    if Enum.empty?(list) do
      [1]
    else
      day = today(list) + 1
      List.replace_at(list, 0, day)
    end
  end

  def has_day_without_birds?(list) do
    Enum.member?(list, 0)
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    length(Enum.filter(list, fn x -> x >= 5 end))
  end
end
