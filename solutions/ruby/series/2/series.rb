class Series
  private

  def initialize(string)
    self.string = string
  end

  attr_accessor :string

  def valid_aruguments?(number)
    !string.empty? && number.positive? && number <= string.size
  end

  public

  def slices(number)
    raise ArgumentError unless valid_aruguments?(number)

    string.chars.each_cons(number).map(&:join)
  end
end
