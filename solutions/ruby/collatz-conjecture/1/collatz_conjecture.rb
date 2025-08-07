class CollatzConjecture
  def self.steps(number, steps = 0)
    raise ArgumentError if number <= 0

    return steps if number == 1

    steps += 1
    if number.even?
      steps(number / 2, steps)
    else
      steps(number * 3 + 1, steps)
    end
  end
end
