class SumOfMultiples

  private

  attr_writer :magical_items
  attr_accessor :level

  def initialize(*magical_items)
    self.magical_items = magical_items.filter(&:nonzero?)
  end

  def multiples?
    magical_items.any? { |item| level > item }
  end

  def points
    magical_items.each_with_object([]) do |magical_item, multiples|
      calculate_multiples(magical_item, multiples)
    end.to_set
  end

  def calculate_multiples(magical_item, multiples)
    product = magical_item

    while product < level
      multiples << product
      product += magical_item
    end

    multiples
  end

  public

  attr_reader :magical_items

  def to(level)
    self.level = level
    multiples? and points.sum or 0
  end

end

