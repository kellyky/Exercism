class Temperature

  SENSORS_PER_UNIT      = 4
  CELSIUS_KELVIN_OFFSET = 273.15
  PRECISION             = 1
  FREEZING_FAHRENHEIT   = 32

  def to_kelvin(celsius)
    celsius + CELSIUS_KELVIN_OFFSET
  end

  def round(celsius)
    celsius.round(PRECISION)
  end

  def to_fahrenheit(celsius)
    (1.8 * celsius + FREEZING_FAHRENHEIT).to_i
  end

  def number_missing_sensors(sensors)
    Missing.calculate(sensors)
  end

  class Missing
    def self.calculate(sensors)
      new(sensors).calculate
    end

    @sensors   : Int32
    @remainder : Int32

    def initialize(sensors)
      @sensors   = sensors
      @remainder = @sensors % SENSORS_PER_UNIT
    end

    def calculate
      @remainder.zero? ? 0 : SENSORS_PER_UNIT - @remainder
    end
  end
end
