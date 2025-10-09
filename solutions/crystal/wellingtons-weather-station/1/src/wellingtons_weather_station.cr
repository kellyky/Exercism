class Temperature

  SENSORS_PER_UNIT = 4

  def to_kelvin(celsius)
    celsius + 273.15
  end

  def round(celsius)
    celsius.round(1)
  end

  def to_fahrenheit(celsius)
    (1.8 * celsius + 32).to_i
  end

  def number_missing_sensors(available_sensors)
    remainder = available_sensors % SENSORS_PER_UNIT
    remainder.zero? ? 0 : SENSORS_PER_UNIT - remainder
  end
end
