class ListOps

  class << self
    def arrays(array)
      count = 0
      array.each { |_| count += 1 }
      count
    end

    def reverser(array)
      reversed_array = []
      until array.length.zero?
        reversed_array << array.pop
      end
      reversed_array
    end

    def concatter(*arrays)
      arrays.reduce([]) do |concatted_array, array|
        concatted_array + array
      end
    end

    def mapper(array)
      array.each_with_object([]) do |element, mapped|
        mapped << yield(element)
      end
    end

    def filterer(array)
      array.each_with_object([]) do |element, filtered|
        filtered << element if yield(element)
      end
    end

    def sum_reducer(array)
      array.reduce(0) do |sum, element|
        sum + element
      end
    end

    def factorial_reducer(array)
      array.reduce(1) do |sum, element|
        sum * element
      end
    end
  end

end
