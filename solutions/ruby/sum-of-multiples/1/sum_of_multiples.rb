class SumOfMultiples

  private

  attr_writer :items
  attr_accessor :multiples

  def initialize(*items)
    self.items = items.filter { |item| item.nonzero? }
    self.multiples = []
  end

  def multiples?(level)
    items.any? { |item| level > item }
  end

  public

  attr_reader :items

  attr_accessor :level

  def to(level)
    return 0 unless multiples?(level)

    self.level = level

    items.each do |item|
      product = item

      while product < level
        self.multiples << product
        product += item
      end
    end

    multiples.to_set.sum
  end

end
