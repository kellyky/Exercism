# Class name: Sulfuras
# Responsibilities:
# - Calculate quality, sell_in for sulfuras
class Sulfuras
  include Conjured, Quality

  private

  attr_accessor :name,
                :conjured,
                :quality,
                :sell_in

  def initialize(name:, sell_in:, quality:)
    self.name     = name
    self.sell_in  = sell_in
    self.quality  = quality
    self.conjured = conjured?
  end

  def decrement_sell_in
    self.sell_in -= 1 if conjured?
  end

  public

  def reset_quality
    self.quality = MIN_QUALITY
  end

  attr_reader :quality,
              :sell_in

  # This is the 'daily' update
  # No change for sulfuras or conjured sulfuras
  def update_quality
    return
  end

  def update_sell_in
    decrement_sell_in
  end

  def update_past_date
    conjured? and reset_quality
  end
end
