require_relative 'brie'
require_relative 'backstage'
require_relative 'sulfuras'
require_relative 'normal'

# Class name: Item
# Responsibilities:
# - Create an 'item' object, whether 'specialty' or 'normal'
# - Update each `item` for quality, sell_in date, and for past-date behavor
class Item
  include Quality, Specialty

  private

  attr_accessor :name,
                :item

  def initialize(name:, sell_in:, quality:)
    self.name    = name
    self.sell_in = sell_in
    self.quality = quality
    self.item    = case
                   when backstage? then Backstage.new(name:, sell_in:, quality:)
                   when brie?      then Brie.new(name:, sell_in:, quality:)
                   when sulfuras?  then Sulfuras.new(name:, sell_in:, quality:)
                   else Normal.new(name:, sell_in:, quality:)
                   end
  end

  def update_quality
    item.update_quality
    self.quality = item.quality
  end

  def update_sell_in
    item.update_sell_in
    self.sell_in = item.sell_in
  end

  def update_past_date
    item.update_past_date
    self.quality = item.quality
  end

  public

  attr_accessor :quality,
                :sell_in

  def update
    update_quality
    update_sell_in
    if sell_in&.negative?
      update_past_date
    end
  end

end
