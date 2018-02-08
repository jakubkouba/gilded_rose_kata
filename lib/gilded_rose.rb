require 'byebug'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      decrease_expiration(item)

      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        decrease_item_quality(item)
      else
        # aged brie and backstage quality increases with time closing to sell day
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            increase_item_quality(item) if item.sell_in < 11
            increase_item_quality(item) if item.sell_in < 6
          end
        end
      end

      if expired?(item)
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            decrease_item_quality(item)
          else
            item.quality = 0
          end
        else
          increase_item_quality(item)
        end
      end

    end
  end

  def decrease_expiration(item)
    item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
  end

  def expired?(item)
    item.sell_in < 0
  end

  def decrease_item_quality(item)
    if item.quality > 0
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.quality = item.quality - 1
      end
    end
  end

  def increase_item_quality(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
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