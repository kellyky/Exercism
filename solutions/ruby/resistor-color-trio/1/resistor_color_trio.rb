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

  # class level stuff

  private

  private_constant :RESISTOR_COLOR

  attr_reader :colors, :code, :multipliers_of_ten
  attr_accessor :resistance

  # instance level stuff

  def initialize(colors)
    @colors = colors.map(&:to_sym)
    @code = @colors.first(2).map { |color| RESISTOR_COLOR[color] }.join
    @multipliers_of_ten = RESISTOR_COLOR[@colors.last]
    self.resistance = decode_colors
    self.unit = 'ohms'
  end

  def decode_colors
    value = code
    multipliers_of_ten.times { value << '0' }
    value.to_i
  end

  public

  attr_accessor :unit

  def label
    if resistance > 1000
      self.unit = 'kiloohms'
      self.resistance /= 1000
    end
    'Resistor value: %s %s' % [resistance, unit]
  end
end

