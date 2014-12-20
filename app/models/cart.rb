class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product
  def add_product_to_cart(product)
    items << product
  end
  def update_quantity_to_cart(product_id, quantity, current_cart_id)
    cart_item = CartItem.where("product_id = ? AND cart_id = ?", product_id, current_cart_id).take!
    cart_item.quantity = cart_item.quantity + quantity
    cart_item.save
  end  
end
