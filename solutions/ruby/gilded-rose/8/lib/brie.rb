require_relative 'conjured'
require_relative 'quality'
require_relative 'specialty'

# Class name: Brie
# Responsibilities:
# - Calculate quality, sell_in for brie
class Brie
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

  def increment_quality
    self.quality += 1
  end

  def decrement_sell_in
    self.sell_in -= 1
  end

  public

  attr_reader :quality,
              :sell_in

  def update_quality
    increment_quality unless max_quality?
  end

  def update_sell_in
    decrement_sell_in
  end

  def update_past_date
    if conjured?
      reset_quality
    else
      increment_quality unless max_quality?
    end
  end

end
