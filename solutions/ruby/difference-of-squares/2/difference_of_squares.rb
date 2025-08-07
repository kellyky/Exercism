class Squares
  def initialize(num)
    @num_range = (0..num)
  end

  def square_of_sum
    (@num_range.sum)**2
  end

  def sum_of_squares
    @num_range.sum { |num| num**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
