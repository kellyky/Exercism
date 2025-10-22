require_relative 'conjured'
require_relative 'quality'
require_relative 'specialty'

class Brie
  include Conjured, Quality

  attr_accessor :name,
                :quality,
                :sell_in,
                :conjured,
                :value_increase_with_age

  def initialize(name:, sell_in:, quality:)
    self.name     = name
    self.sell_in  = sell_in
    self.quality  = quality
    self.conjured = conjured?
    self.value_increase_with_age = !conjured?
  end

  def increment_quality
    self.quality += 1
  end

  def reset_quality
    self.quality = 0
  end

  public

  attr_accessor :quality,
                :sell_in

  def update_quality
    increment_quality unless max_quality?
  end

  def update_sell_in
    self.sell_in -= 1
  end

  def update_past_date
    if conjured?
      reset_quality
    else
      increment_quality unless max_quality?
    end
  end

end
