class Backstage
  include Conjured, Quality

  BACKSTAGE_QUALITY = {
    ->(days) { (0...6).include? days }  => 3,
    ->(days) { (6...11).include? days } => 2,
    ->(days) { (11..).include? days }   => 1,
    ->(days) { (...0).include? days }   => 0
  }

  private

  attr_accessor :name,
                :conjured,
                :value

  def initialize(name:, sell_in:, quality:)
    self.name     = name
    self.sell_in  = sell_in
    self.quality  = quality
    self.conjured = conjured?
    self.value    = 0
  end

  def increment_quality
    self.quality += 1 unless max_quality?
  end

  def within_date_range?(days)
    days[sell_in]
  end

  def calculate_value
    BACKSTAGE_QUALITY.each do |days, amount|
      if within_date_range?(days)
        amount.downto(1) do
          self.value += 1
        end
      end
    end

    self.value -= 1 if conjured?
  end

  public

  attr_accessor :quality,
                :sell_in

  def update_quality
    calculate_value

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
