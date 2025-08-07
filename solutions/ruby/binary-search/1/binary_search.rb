class BinarySearch

  def initialize(numbers)
    self.numbers = numbers.sort
    @starting_index = 0
    @middle_index = numbers.size / 2
    @ending_index = numbers.size - 1
  end

  public

  attr_accessor :numbers

  def search_for(n)
    if numbers[@starting_index..@ending_index].size == 1
      if numbers[@starting_index] == n
        return @starting_index
      else
        return
      end
    elsif numbers[@starting_index..@ending_index].size == 0
      return
    end

    if n < numbers[@middle_index]
      @ending_index = @middle_index - 1
      @middle_index = (@starting_index + @ending_index) / 2
      search_for(n)
    elsif n > numbers[@middle_index]
      @starting_index = @middle_index + 1
      @middle_index = (@starting_index + @ending_index) / 2
      search_for(n)
    else
      @middle_index
    end
  end
end
