module ProductsHelper
  def cart_product_quantity(cart_id)
    #找出這台車中所有商品數, 並且累加起來.
    CartItem.where(cart_id: cart_id).inject(0){ |sum, i| sum + i.quantity}
  end
  def show_product_name(product_id)
    Product.find(product_id).name
  end
  def show_product_price(product_id)
    Product.find(product_id).price
  end
end
