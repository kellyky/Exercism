class Squares
  def initialize(num)
    @num = num
    @nums_squares = build_nums
  end

  def build_nums
    (1..@num).each.with_object({}) do |key, hash|
      hash[key] = key ** 2
    end
  end
  
  def square_of_sum
    @nums_squares.keys.sum ** 2
  end

  def sum_of_squares
    @nums_squares.values.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end