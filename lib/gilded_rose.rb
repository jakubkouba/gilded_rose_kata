require 'byebug'
require 'aged_brie'
require 'backstage_pass'
require 'ordinary_product'


class GildedRose

  def initialize(items)
    @items = items
  end

  MAX_QUALITY = 50

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        AgedBrie.update(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        BackstagePass.update(item)
      when 'Sulfuras, Hand of Ragnaros'
        next
      else
        OrdinaryProduct.update(item)
      end
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