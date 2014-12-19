class ProductsController < ApplicationController
  def index
    @products = Product.all
    @carts = CartItem.where(cart_id: current_cart.id)
  end
  def show
    @product = Product.find(params[:id])
  end
  def add_to_cart
    #show Cart
    @product = Product.find(params[:id])
    @add_item = CartItem.create(cart_id: current_cart.id, product_id: @product.id, prince: @product.price)
    #current_cart.add_product_to_cart(@product)
    
    redirect_to products_url
  end
end
