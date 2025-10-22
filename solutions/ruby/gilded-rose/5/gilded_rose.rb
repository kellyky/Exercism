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

  def update!
    items.each { |item| item.update }
  end
end

