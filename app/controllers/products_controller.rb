class ProductsController < ApplicationController
  def index
    @products = Product.all
    @carts = CartItem.where(:cart_id => session[:cart])
  end
  def show
    @product = Product.find(params[:id])
  end
  def add_to_cart
    current_cart
    #show Cart
    #redirect_to products_url
  end
end
