require 'byebug'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      decrease_expiration(item)

      if ordinary_product(item)
        decrease_item_quality(item)
      else
        # aged brie and backstage quality increases with time closing to sell day
        if item.quality < 50
          item.quality += 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            increase_item_quality(item) if item.sell_in < 11
            increase_item_quality(item) if item.sell_in < 6
          end
        end
      end

      if expired?(item)
        if not_aged_brie?(item)
          if not_backstage_pass?(item)
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

  def ordinary_product(item)
    not_aged_brie?(item) && not_backstage_pass?(item)
  end

  def not_backstage_pass?(item)
    item.name != 'Backstage passes to a TAFKAL80ETC concert'
  end

  def aged_brie?(item)
    item.name == 'Aged Brie'
  end

  def not_aged_brie?(item)
    !aged_brie?(item)
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