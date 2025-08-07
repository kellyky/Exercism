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
    return middle_index if n == numbers[middle_index] || final_number_matches?(n)

    return if numbers.empty? || one_number_left

    update_ending_index if n < numbers[middle_index]
    update_starting_index if n > numbers[middle_index]
    update_middle_index

    search_for(n)
  end

  def one_number_left
    numbers[starting_index..ending_index].size == 1
  end

  def final_number_matches?(n)
    one_number_left && numbers[starting_index] == n
  end

  def update_starting_index
    self.starting_index = middle_index + 1
  end

  def update_middle_index
    self.middle_index = (starting_index + ending_index) / 2
  end

  def update_ending_index
    self.ending_index = middle_index - 1
  end
end
