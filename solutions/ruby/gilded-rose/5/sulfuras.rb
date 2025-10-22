# Class name: Sulfuras
# Responsibilities:
# - Calculate quality, sell_in for sulfuras
class Sulfuras
  include Conjured, Quality

  private

  attr_accessor :name,
                :conjured

  def initialize(name:, sell_in:, quality:)
    self.name     = name
    self.conjured = conjured?
    self.quality  = quality
    self.sell_in  = sell_in
  end

  public

  attr_accessor :quality,
                :sell_in

  # This is the 'daily' update
  # No change for sulfuras or conjured sulfuras
  def update_quality
    return
  end

  def update_sell_in
    conjured? and self.sell_in -= 1
  end

  def update_past_date
    conjured? and self.quality = MIN_QUALITY
  end
end
