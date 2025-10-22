# Class name: Backstage
# Responsibilities:
# - Calculate quality, sell_in for backstage passes
class Backstage
  include Conjured, Quality

  private

  attr_accessor :name,
                :conjured

  def initialize(name:, sell_in:, quality:)
    self.name     = name
    self.sell_in  = sell_in
    self.quality  = quality
    self.conjured = conjured?
  end

  def increment_quality
    self.quality += 1 unless max_quality?
  end

  def within_date_range?(days)
    days[sell_in]
  end

  def value
    value = case sell_in
            when 0...6  then 3
            when 6...11 then 2
            when 11..   then 1
            when ...0   then 0
            end

    conjured? ? value - 1 : value
  end

  public

  attr_accessor :quality,
                :sell_in

  def update_quality
    value.downto(1) do
      increment_quality
    end
  end

  def update_sell_in
    self.sell_in -= 1
  end

  def update_past_date
    self.quality = 0
  end

end
