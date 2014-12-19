class Cart < ActiveRecord::Base
  has_many :items, :through => :cart_items, :source => :product
  def add_product_to_cart(@product)
    itms << product
  end
end
