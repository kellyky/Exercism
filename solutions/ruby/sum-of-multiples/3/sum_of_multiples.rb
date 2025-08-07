class SumOfMultiples

  private

  attr_writer :items

  def initialize(*items)
    self.items = items.filter { |item| item.nonzero? }
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

    items.each_with_object([]) do |item, points|
      product = item

      while product < level
        points << product
        product += item
      end

    end.to_set.sum
  end

end
