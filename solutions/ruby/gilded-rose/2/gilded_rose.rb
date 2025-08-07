Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      Inventory.new(item).update unless item.name == "Sulfuras, Hand of Ragnaros"
    end
  end
end

class Inventory
  def initialize(item)
    @item = item
  end

  attr_reader :item

  public

  def update
    ages_poorly? ? decrease_quality : increase_quality

    item.sell_in -= 1

    handle_subzero_sell_time
  end

  private

  attr_writer :item

  def ages_poorly?  # placeholder name
    not brie? || backstage?
  end

  # Managing quality
  def decrease_quality
    return unless item.quality > 0

    item.quality -= 1
  end

  def increase_quality
    return unless item.quality < 50

    item.quality += 1

    increase_quality_backstage
  end

  def increase_quality_backstage
    return unless backstage? && item.quality < 50

    amount = case item.sell_in
             in 1..5
               2
             in 6..10
               1
             else
               0
             end

    item.quality += amount
  end


  # Logic for handling Expired Goods
  def handle_subzero_brie
    return unless brie?

    increase_quality
  end

  def handle_subzero_non_brie
    return if brie?

    if !backstage?
      decrease_quality
    else
      item.quality = item.quality - item.quality
    end
  end

  def handle_subzero_sell_time
    return unless item.sell_in < 0

    handle_subzero_brie or handle_subzero_non_brie
  end


  # Item Name 
  def brie?
    item.name == "Aged Brie"
  end

  def backstage?
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end
end
