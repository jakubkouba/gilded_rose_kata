module Updateable

  MAX_QUALITY = 50

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