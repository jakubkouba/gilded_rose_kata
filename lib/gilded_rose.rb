require 'byebug'
require 'aged_brie'
require 'backstage_pass'
require 'ordinary_product'
require 'sulfuras'


class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        AgedBrie.update(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        BackstagePass.update(item)
      when 'Sulfuras, Hand of Ragnaros'
        Sulfuras.update
      else
        OrdinaryProduct.update(item)
      end
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