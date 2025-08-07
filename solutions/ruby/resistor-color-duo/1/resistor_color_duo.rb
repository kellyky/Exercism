class ResistorColorDuo
  RESISTOR_COLOR = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }

  def self.value(colors)
    colors.slice(0, 2)
          .map { |color| RESISTOR_COLOR[color] }
          .join
          .to_i
  end
end
