class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product
  def add_product_to_cart(product)
    items << product
  end
  def update_quantity_to_cart(product_id, quantity, current_cart_id)
    # 要更新數量必須要知道, 哪一台購物車要更新 & 要更新哪一樣商品!及最重要的'更新數量'
    cart_item = CartItem.where("product_id = ? AND cart_id = ?", product_id, current_cart_id).take!
    cart_item.quantity = cart_item.quantity + quantity
    cart_item.save
  end  
  def total_price(cart_id)
    #找出這台車有的產品及產品價格(test)
    #items.each(){ |item| item.price}
    #找出數量(test)
    #artItem.where(product_id: 2,cart_id: 5).take!.quantity
    #運算
    items.inject(0){|sum, item| sum + item.price * CartItem.where("product_id = ? AND cart_id = ?", item.id, cart_id).take!.quantity }
    
    #note利用.map & 把quantity拆成另一個method
  end
end
