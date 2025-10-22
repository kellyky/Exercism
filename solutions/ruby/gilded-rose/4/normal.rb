class Normal
  include Conjured, Quality

  attr_accessor :name,
                :conjured

  def initialize(name:, sell_in:, quality:)
    self.name     = name
    self.sell_in  = sell_in
    self.quality  = quality
    self.conjured = conjured?
  end

  def decrement_quality
    self.quality -= 1 unless min_quality?
  end

  def reset_quality
    self.quality = 0
  end

  public

  attr_accessor :quality,
                :sell_in

  def update_quality
    decrement_quality
    conjured? and decrement_quality
  end

  def update_sell_in
    self.sell_in -= 1
  end

  def update_past_date
    decrement_quality
    conjured? and reset_quality
  end

end
