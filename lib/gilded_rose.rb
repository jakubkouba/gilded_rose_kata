require 'byebug'

class GildedRose

  def initialize(items)
    @items = items
  end

  MAX_QUALITY = 50

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        increase_item_quality(item)
        increase_item_quality(item) if expired?(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        increase_item_quality(item)
        increase_item_quality(item) if item.sell_in <= 10
        increase_item_quality(item) if item.sell_in <= 5
        item.quality = 0 if expired?(item)
      when 'Sulfuras, Hand of Ragnaros'
        next
      else
        decrease_item_quality(item)
      end

      decrease_expiration(item)
    end
  end

  def decrease_expiration(item)
    item.sell_in -= 1
  end

  def expired?(item)
    item.sell_in <= 0
  end

  def decrease_item_quality(item)
    return unless item.quality > 0
    if expired?(item)
      item.quality -= 2
    else
      item.quality -= 1
    end
  end

  def increase_item_quality(item)
    return unless item.quality < MAX_QUALITY
    item.quality += 1
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end