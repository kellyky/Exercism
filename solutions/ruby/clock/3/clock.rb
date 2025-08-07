class Clock

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24

  private

  attr_writer :hour, :minute

  def initialize(hour: 0, minute: 0)
    self.hour = hour
    self.minute = minute
  end

  def subtract_hours_per_day
    self.hour -= HOURS_PER_DAY
  end

  def subtract_minutes_per_hour
    self.hour += 1
    self.minute -= MINUTES_PER_HOUR
  end

  def add_hours_per_day
    self.hour += HOURS_PER_DAY
  end

  def add_minutes_per_hour
    self.hour -= 1
    self.minute += MINUTES_PER_HOUR
  end

  public

  attr_accessor :hour, :minute

  def +(other)
    self.hour += other.hour
    self.minute += other.minute
    to_s
  end

  def -(other)
    self.hour -= other.hour
    self.minute -= other.minute
    to_s
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    subtract_minutes_per_hour until minute < MINUTES_PER_HOUR
    subtract_hours_per_day until hour < HOURS_PER_DAY
    add_minutes_per_hour until minute >= 0
    add_hours_per_day until hour >= 0

    "#{hour.to_s.rjust(2, '0')}:#{minute.to_s.rjust(2, '0')}"
  end

end
