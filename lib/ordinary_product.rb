require 'updateable'

class OrdinaryProduct
  extend Updateable

  def self.update(item)
    decrease_item_quality(item)
    decrease_expiration(item)
  end
end