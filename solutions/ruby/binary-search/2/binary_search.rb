class BinarySearch
  def initialize(numbers)
    self.numbers = numbers.sort
    self.starting_index = 0
    self.middle_index = numbers.size / 2
    self.ending_index = numbers.size - 1
  end

  attr_accessor :numbers,
                :starting_index,
                :middle_index,
                :ending_index

  def search_for(n)
    return middle_index if n == numbers[middle_index]

    numbers_length = numbers[starting_index..ending_index].size

    return if numbers_length.zero?

    if numbers_length == 1
      return numbers[starting_index] == n ? starting_index : nil
    end

    if n < numbers[middle_index]
      self.ending_index = middle_index - 1
    elsif n > numbers[middle_index]
      self.starting_index = middle_index + 1
    end

    self.middle_index = (starting_index + ending_index) / 2
    search_for(n)
  end

end
