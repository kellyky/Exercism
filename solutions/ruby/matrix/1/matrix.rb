class Matrix

  private

  attr_reader :numbers
  attr_accessor :grid

  def initialize(numbers)
    @numbers = numbers
    self.grid = grid
  end

  def grid
    numbers.split("\n")
      .map { |numeric_string| numeric_string
      .split
      .map(&:to_i)
    }
  end

  public

  def row(row_num)
    grid[row_num - 1]
  end

  def column(column_num)
    grid.transpose[column_num - 1]
  end
end
