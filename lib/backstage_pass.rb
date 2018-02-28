require 'updateable'

class BackstagePass
  extend Updateable

  def self.update(item)
    increase_item_quality(item)
    increase_item_quality(item) if item.sell_in <= 10
    increase_item_quality(item) if item.sell_in <= 5
    item.quality = 0 if expired?(item)
  end
end