class ProductsController < ApplicationController
  def index
    @products = Product.all
    @carts = CartItem.where(:cart_id => session[:cart])
  end
  def show
    @product = Product.find(params[:id])
  end
  def add_to_cart
    if session[:cart].nil?
       @cart = Cart.create
       session[:cart]= @cart.id
    end
    #find Product, get/pid, prince/
    @product = Product.find(params[:id])
    session[:pid] = @product.id
    session[:price] = @product.price
    #add to cart_items/cart.id, pid, prince/
    @add_item = CartItem.create(:cart_id => session[:cart], :product_id => session[:pid], :prince => session[:price])
    
    #show Cart
    redirect_to products_url
  end
end
