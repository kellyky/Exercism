class SumOfMultiples

  private

  attr_writer :items
  attr_accessor :points

  def initialize(*items)
    self.items = items.filter { |item| item.nonzero? }
    self.points = []
  end

  def multiples?(level)
    items.any? { |item| level > item }
  end

  def multiples(item)
    product = item

    while product < level
      self.points << product
      product += item
    end
  end

  public

  attr_reader :items

  attr_accessor :level

  def to(level)
    return 0 unless multiples?(level)

    self.level = level

    items.each { |item| multiples(item) }

    points.to_set.sum
  end

end
