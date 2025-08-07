class Triangle
  def initialize(side_lengths)
    @side_lengths = side_lengths
  end

  def triangle?
    a, b, c = @side_lengths
    (a + b >= c) && (b + c >= a) && (a + c >= b) && @side_lengths.none?(0)
  end
  
  def equilateral?
    return false unless triangle?

    @side_lengths.uniq.size == 1
  end

  def isosceles?
    return false unless triangle?
    
    @side_lengths.uniq.size < 3 
  end

  def scalene?
    return false unless triangle?
    
    @side_lengths.uniq.size == 3
  end
end