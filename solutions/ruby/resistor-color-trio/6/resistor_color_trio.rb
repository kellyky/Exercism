class ResistorColorTrio

  RESISTOR_COLOR = {
     black: 0,
     brown: 1,
       red: 2,
    orange: 3,
    yellow: 4,
     green: 5,
      blue: 6,
    violet: 7,
      grey: 8,
     white: 9,
  }

  private

  private_constant :RESISTOR_COLOR

  attr_reader :colors, :numeric_code, :zeros_to_append, :raw_code
  attr_writer :resistance, :unit

  def initialize(colors)
    @colors = colors.map(&:to_sym)
    @raw_code = @colors.first(2)
    self.unit = 'ohms'
    self.resistance = calculate_resistance
  end

  def calculate_resistance
    numeric_code = raw_code.map { |color| RESISTOR_COLOR[color] }.join
    RESISTOR_COLOR[colors.last].times { numeric_code << '0' }
    numeric_code.to_i
  end

  def convert_to_kiloohms
    self.unit = 'kiloohms'
    self.resistance /= 1000
  end

  public

  attr_reader :resistance, :unit

  def label
    convert_to_kiloohms if resistance > 1000

    'Resistor value: %s %s' % [resistance, unit]
  end

end
