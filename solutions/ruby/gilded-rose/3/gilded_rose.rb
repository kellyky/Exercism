require_relative 'item'

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

