require 'byebug'

class GildedRose

  def initialize(items)
    @items = items
  end

  MAX_QUALITY = 50

  def update_quality
    @items.each do |item|
      decrease_expiration(item)

      case item.name
      when 'Aged Brie'
        increase_item_quality(item)
        increase_item_quality(item) if expired?(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        increase_item_quality(item)
        increase_item_quality(item) if item.sell_in < 11
        increase_item_quality(item) if item.sell_in < 6
        item.quality = 0 if expired?(item)
      when 'Sulfuras, Hand of Ragnaros'
      else
        decrease_item_quality(item)
      end
    end
  end

  def ordinary_product(item)
    not_aged_brie?(item) && not_backstage_pass?(item)
  end

  def backstage_pass?(item)
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def not_backstage_pass?(item)
    !backstage_pass?(item)
  end

  def aged_brie?(item)
    item.name == 'Aged Brie'
  end

  def not_aged_brie?(item)
    !aged_brie?(item)
  end

  def decrease_expiration(item)
    return if sulfuras?(item)
    item.sell_in -= 1
  end

  def sulfuras?(item)
    item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def expired?(item)
    item.sell_in < 0
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