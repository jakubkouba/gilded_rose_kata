require 'byebug'

class GildedRose

  def initialize(items)
    @items = items
  end

  MAX_QUALITY = 50

  def update_quality
    @items.each do |item|
      decrease_expiration(item)

      if ordinary_product(item)
        decrease_item_quality(item)
      elsif item.quality < MAX_QUALITY
        item.quality += 1

        if backstage_pass?(item)
          increase_item_quality(item) if item.sell_in < 11
          increase_item_quality(item) if item.sell_in < 6
        end
      end

      if expired?(item)
        if aged_brie?(item)
          increase_item_quality(item)
        elsif backstage_pass?(item)
          item.quality = 0
        else
          decrease_item_quality(item)
        end
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
    return if sulfuras?(item)
    item.quality -= 1 if item.quality > 0
  end

  def increase_item_quality(item)
    item.quality += 1 if item.quality < MAX_QUALITY
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