class Clock
  private

  def initialize(hour:0, minute:0)
    self.hour = hour
    self.minute = minute
  end

  def handle_hours_overflow
    self.hour -= 24
  end

  def handle_minutes_overflow
    self.hour += 1
    self.minute -= 60
  end

  def handle_negative_hour
    self.hour += 24
  end

  def handle_negative_minutes
    self.hour -= 1
    self.minute += 60
  end

  public

  attr_accessor :hour, :minute

  def +(example)
    self.hour += example.hour
    self.minute += example.minute
    self.to_s
  end

  def -(example)
    self.hour -= example.hour
    self.minute -= example.minute
    self.to_s
  end

  def ==(example)
    self.to_s == example.to_s
  end

  def to_s
    until minute < 60
      handle_minutes_overflow
    end

    until hour < 24
      handle_hours_overflow
    end

    until minute >= 0
      handle_negative_minutes
    end

    until hour >= 0
      handle_negative_hour
    end

    "#{hour.to_s.rjust(2, '0')}:#{minute.to_s.rjust(2, '0')}"
  end
end
