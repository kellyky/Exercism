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

  attr_reader :colors, :numeric_code, :zeros_to_append
  attr_accessor :resistance

  def initialize(colors)
    @colors = colors.map(&:to_sym)
    @numeric_code = @colors.first(2).map { |color| RESISTOR_COLOR[color] }.join
    @zeros_to_append = RESISTOR_COLOR[@colors.last]
    self.resistance = denumeric_code_colors
    self.unit = 'ohms'
  end

  def denumeric_code_colors
    zeros_to_append.times { numeric_code << '0' }
    numeric_code.to_i
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

