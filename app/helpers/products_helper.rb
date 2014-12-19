module ProductsHelper
  def add_item
    if session[:product].nil?
      session[:product] = []
    end
  end
end
