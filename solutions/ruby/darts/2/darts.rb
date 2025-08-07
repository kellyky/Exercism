class Darts
  def initialize(x, y)
    self.radius = Math.sqrt(x ** 2 + y ** 2)
  end

  attr_accessor :radius

  public

  def score
    case radius
    when 0..1 then 10
    when 1..5 then 5
    when 5..10 then 1
    else 0
    end
  end
end
