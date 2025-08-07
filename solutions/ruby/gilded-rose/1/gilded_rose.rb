Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  private

  def initialize(items)
    @items = items
  end

  # Name checks - starting here b/c it's a lot to type
  def backstage?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert" 
  end

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def brie?(item)
    item.name == "Aged Brie"
  end

  # helper - basically just aliasing `not`
  def neither_nor(condition)
    # might not be a keeper / trying for readability
    not condition
  end

  def ages_poorly?(item)  # placeholder name
    neither_nor brie?(item) || backstage?(item) 
  end 

  # Managing quality
  def decrease_quality(item)
    return unless item.quality > 0

    item.quality -= 1
  end


  def increase_quality(item)
    return unless item.quality < 50

    item.quality += 1

    increase_quality_backstage(item)
  end

  def increase_quality_backstage(item)
    return unless backstage?(item) && item.quality < 50

    amount = 0
    if item.sell_in < 6
      amount += 2
    elsif item.sell_in < 11
      amount += 1
    end

    item.quality += amount
  end

  # Handle sell-in days
  def decrease_sell_in(item)
    item.sell_in -= 1
  end

  # Logic for handling Expired Goods
  def handle_subzero_brie(item)
    return unless brie?(item)
    increase_quality(item)
  end

  def handle_subzero_non_brie(item)
    return if brie?(item)

    if !backstage?(item)
      decrease_quality(item)
    else
      item.quality = item.quality - item.quality
    end
  end

  def handle_subzero_sell_time(item)
    return unless item.sell_in < 0

    handle_subzero_brie(item) or handle_subzero_non_brie(item)

  end

  def update_item(item)
    ages_poorly?(item) ? decrease_quality(item) : increase_quality(item)

    decrease_sell_in(item)

    handle_subzero_sell_time(item)
  end

  public

  def update!
    @items.each { |item| update_item(item) unless sulfuras?(item)}
  end
end
