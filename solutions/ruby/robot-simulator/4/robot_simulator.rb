class Robot

  private

  VALID_DIRECTIONS = %i[east west north south]

  RIGHT_TURNS = {
    north: :east,
     east: :south,
    south: :west,
     west: :north
  }

  LEFT_TURNS = RIGHT_TURNS.invert

  def initialize
    self.bearing = bearing
    self.x = x
    self.y = y
  end

  public

  attr_accessor :bearing, :x, :y

  def advance
    case bearing
    when :north then self.y += 1
    when :south then self.y -= 1
    when :east then self.x += 1
    when :west then self.x -= 1
    end
  end

  def at(x, y)
    self.x = x
    self.y = y
  end

  def coordinates
    [x, y]
  end

  def orient(direction)
    raise ArgumentError unless VALID_DIRECTIONS.include?(direction)
    self.bearing = direction
  end

  def turn_right
    self.bearing = RIGHT_TURNS[bearing]
  end

  def turn_left
    self.bearing = LEFT_TURNS[bearing]
  end
end

class Simulator
  private

  DECODER = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance,
  }

  public

  def instructions(steps)
    steps.chars.map { |step| DECODER[step] }
  end

  def evaluate(robot, steps)
    instructions = instructions(steps)
    instructions.each { |instruction| robot.send(instruction) }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.bearing = direction
  end
end
