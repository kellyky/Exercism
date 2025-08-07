class Matrix
  private

  attr_reader :numbers
  attr_writer :grid

  def initialize(numbers)
    @numbers = numbers
    self.grid = grid
  end

  def grid
    numbers.split("\n").map do |string_of_numbers|
      string_of_numbers.split.map(&:to_i)
    end
  end

  public

  def row(row_num)
    grid[row_num - 1]
  end

  def column(column_num)
    grid.transpose[column_num - 1]
  end
end
