class ListOps

  def self.arrays(array)
    array.length
  end

  def self.reverser(array)
    array.reverse
  end

  def self.concatter(*arrays)
    arrays.reduce([]) do |concatted_array, array|
      concatted_array + array
    end
  end

  def self.mapper(array)
    array.each_with_object([]) do |element, mapped|
      mapped << yield(element)
    end
  end

  def self.filterer(array)
    array.each_with_object([]) do |element, filtered|
      filtered << element if yield(element)
    end
  end

  def self.sum_reducer(array)
    array.reduce(0) do |sum, element|
      sum + element
    end
  end

  def self.factorial_reducer(array)
    array.reduce(1) do |sum, element|
      sum * element
    end
  end

end
