class Clock
  private

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24

  def initialize(hour: 0, minute: 0)
    self.hour = hour
    self.minute = minute
  end

  def handle_hours_overflow
    self.hour -= HOURS_PER_DAY
  end

  def handle_minutes_overflow
    self.hour += 1
    self.minute -= MINUTES_PER_HOUR
  end

  def handle_negative_hour
    self.hour += HOURS_PER_DAY
  end

  def handle_negative_minutes
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
    handle_minutes_overflow until minute < MINUTES_PER_HOUR
    handle_hours_overflow until hour < HOURS_PER_DAY
    handle_negative_minutes until minute >= 0
    handle_negative_hour until hour >= 0

    "#{hour.to_s.rjust(2, '0')}:#{minute.to_s.rjust(2, '0')}"
  end
end
