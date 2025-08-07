class Clock

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  TIME_FORMAT = '%s:%s'
  PAD = ->(hour) { hour.to_s.rjust(2, '0') }

  private

  def initialize(hour: 0, minute: 0)
    self.hour = hour
    self.minute = minute

    normalize_time
  end

  def normalize_time
    normalize_negative_minutes
    normalize_excess_minutes
    normalize_negative_hours
    normalize_excess_hours
  end

  def normalize_excess_hours
    self.hour -= HOURS_PER_DAY until hour < HOURS_PER_DAY
  end

  def normalize_excess_minutes
    while minute >= MINUTES_PER_HOUR
      self.hour += 1
      self.minute -= MINUTES_PER_HOUR
    end
  end

  def normalize_negative_hours
    self.hour += HOURS_PER_DAY until hour >= 0
  end

  def normalize_negative_minutes
    while minute < 0
      self.hour -= 1
      self.minute += MINUTES_PER_HOUR
    end
  end

  public

  attr_accessor :hour, :minute

  def +(other)
    self.hour += other.hour
    self.minute += other.minute
    normalize_excess_minutes
    normalize_excess_hours
    to_s
  end

  def -(other)
    self.hour -= other.hour
    self.minute -= other.minute
    normalize_negative_minutes
    normalize_negative_hours
    to_s
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    TIME_FORMAT % [PAD[hour], PAD[minute]]
  end

end
