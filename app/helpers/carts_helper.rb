module CartsHelper
  def show_cart_total_price(current_cart)
    #CartItem的quantity*Product的price
    current_cart.total_price(current_cart.id)
  end
end
