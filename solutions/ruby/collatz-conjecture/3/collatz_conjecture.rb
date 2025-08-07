class CollatzConjecture
  def self.steps(number, count = 0)
    raise ArgumentError if number < 1

    return count if number == 1

    if number.even?
      steps(number / 2, count + 1)
    else
      steps(number * 3 + 1, count + 1)
    end
  end
end
