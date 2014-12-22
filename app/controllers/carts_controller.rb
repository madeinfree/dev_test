class CartsController < ApplicationController
  def index
    @carts = CartItem.where(cart_id: current_cart.id)
  end
end
