require 'updateable'

class AgedBrie
  extend Updateable

  def self.update(item)
    increase_item_quality(item)
    increase_item_quality(item) if expired?(item)
    decrease_expiration(item)
  end
end