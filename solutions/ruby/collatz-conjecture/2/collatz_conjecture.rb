class CollatzConjecture
  def self.steps(number, count = 0)
    raise ArgumentError if number < 1

    return count if number == 1

    count += 1
    number.even? ? steps(number / 2, count) : steps(number * 3 + 1, count)
  end
end
