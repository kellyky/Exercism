class Clock

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  TIME_FORMAT = '%{hour}:%{minute}'
  TWO_DIGIT_PAD = ->(time_unit) { time_unit.to_s.rjust(2, '0') }

  private

  def initialize(hour: 0, minute: 0)
    self.hour = hour
    self.minute = minute

    normalize
  end

  def normalize
    self.hour = (hour + minute / MINUTES_PER_HOUR) % HOURS_PER_DAY
    self.minute = minute % MINUTES_PER_HOUR
  end

  public

  attr_accessor :hour, :minute

  def +(other)
    self.hour += other.hour
    self.minute += other.minute
    normalize
    to_s
  end

  def -(other)
    self.hour -= other.hour
    self.minute -= other.minute
    normalize
    to_s
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    TIME_FORMAT % {hour: TWO_DIGIT_PAD[hour], minute: TWO_DIGIT_PAD[minute]}
  end

end
