class Clock

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  TIME = '%s:%s'

  private

  def initialize(hour: 0, minute: 0)
    self.hour = hour
    self.minute = minute

    add_minutes_per_hour
    subtract_minutes_per_hour
    add_hours_per_day
    subtract_hours_per_day
  end

  def subtract_hours_per_day
    return if hour < HOURS_PER_DAY

    self.hour -= HOURS_PER_DAY
    subtract_hours_per_day
  end

  def subtract_minutes_per_hour
    return if minute < MINUTES_PER_HOUR

    self.hour += 1
    self.minute -= MINUTES_PER_HOUR

    subtract_minutes_per_hour
  end

  def add_hours_per_day
    return if hour >= 0

    self.hour += HOURS_PER_DAY

    add_hours_per_day
  end

  def add_minutes_per_hour
    return if minute >= 0


    self.hour -= 1
    self.minute += MINUTES_PER_HOUR

    add_minutes_per_hour
  end

  def hours
    hour.to_s.rjust(2, '0')
  end

  def minutes
    minute.to_s.rjust(2, '0')
  end

  public

  attr_accessor :hour, :minute

  def +(other)
    self.hour += other.hour
    self.minute += other.minute
    subtract_minutes_per_hour
    subtract_hours_per_day
    to_s
  end

  def -(other)
    self.hour -= other.hour
    self.minute -= other.minute
    add_minutes_per_hour
    add_hours_per_day
    to_s
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    TIME % [hours, minutes]
  end

end
