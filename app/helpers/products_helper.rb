module ProductsHelper
  # helper_method :current_cart
  def current_cart
    @current_cart ||= find_cart
  end
  def find_cart
    cart = Cart.find_by(:id => session[:cart_id])
    unless cart.present?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
  end
end
