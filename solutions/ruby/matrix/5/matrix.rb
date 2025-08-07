class Matrix
  private

  attr_reader :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def grid
    numbers.lines.map do |lines|
      lines.split.map(&:to_i)
    end
  end

  public

  def row(number)
    grid[number - 1]
  end

  def column(number)
    grid.transpose[number - 1]
  end
end
