class Series
  private

  def initialize(string)
    self.string = string
  end

  attr_accessor :string

  def valid_aruguments?(number)
    !string.empty? && valid_slice_length?(number)
  end

  def valid_slice_length?(number)
    number.positive? && number <= string.size
  end

  public

  def slices(number)
    raise ArgumentError unless valid_aruguments?(number)

    results = []
    slice_starter = 0
    while slice_starter <= string.length - number
      results << string.slice(slice_starter, number)
      slice_starter += 1
    end

    results
  end
end
