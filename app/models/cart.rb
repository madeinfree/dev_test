class Cart < ActiveRecord::Base
  has_many :items, :through => :cart_items, :source => :product
end
