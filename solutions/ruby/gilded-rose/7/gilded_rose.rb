require_relative 'item'

# Class name: GildedRose
# Responsibilities:
# - Defines item list
# - Cycles through each item to update it
class GildedRose

  private

  attr_accessor :items

  def initialize(items)
    self.items = items
  end

  public

  # The shop processes for each item includes assessing quality, sell_in, and handling past_date items
  def update!
    items.each do |item|
      item.update_quality
      item.update_sell_in
      item.update_past_date
    end
  end
end

