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
    #判斷商品是否還有庫存
    if @product.stock >0
      #判斷這台購物車有沒有(關聯)加過這組商品了
      if !current_cart.items.include?(@product)
        current_cart.add_product_to_cart(@product)
      else
        #加過就要變成是累加數量
        current_cart.update_quantity_to_cart(params[:id], 1, current_cart.id)
      end
    else
      flash[:notice] = "產品 #{@product.name}庫存數量為0 您不能購買"
    end
    redirect_to products_url
  end
end
