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
  attr_accessor :resistance

  def initialize(colors)
    @colors = colors.map(&:to_sym)
    @raw_code = @colors.first(2)
  end

  def ohms
    numeric_code = raw_code.map { |color| RESISTOR_COLOR[color] }.join
    RESISTOR_COLOR[colors.last].times { numeric_code << '0' }
    numeric_code.to_i
  end

  public

  def label
    resistance = ohms
    unit = 'ohms'

    if ohms > 1000
      unit = 'kiloohms'
      resistance /= 1000
    end
    'Resistor value: %s %s' % [resistance, unit]
  end
end
