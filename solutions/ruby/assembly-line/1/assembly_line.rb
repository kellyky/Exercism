class AssemblyLine
  BASE_RATE = 221
  def initialize(speed)
    @speed = speed
    @success_rate = calculate_success_rate
  end

  def calculate_success_rate
    case @speed
    when 1..4
      1.0
    when 5..8
      0.9
    when 9
      0.8
    when 10
      0.77
    end
  end

  def production_rate_per_hour
    BASE_RATE * @success_rate * @speed
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
 