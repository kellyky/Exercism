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
    self.resistance = Resistance.calculate(@colors, @colors.first(2))
    self.unit = 'ohms'
  end

  def to_kiloohms
    self.unit = 'kiloohms'
    self.resistance /= 1000
  end

  public

  attr_reader :resistance, :unit

  def label
    to_kiloohms if resistance > 1000

    'Resistor value: %s %s' % [resistance, unit]
  end

end

class Resistance < ResistorColorTrio
  def self.calculate(colors, raw_code)
    new(colors, raw_code).calculate
  end

  private

  attr_reader :colors, :raw_code

  def initialize(colors, raw_code)
    @colors = colors
    @raw_code = raw_code
    self.numeric_code = raw_code.map { |color| RESISTOR_COLOR[color] }.join
  end

  public

  attr_writer :numeric_code

  def calculate
    RESISTOR_COLOR[colors.last].times { numeric_code << '0' }
    numeric_code.to_i
  end

end
