class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :desttoy
  has_many :items, :through => :cart_items, :source => :product
end
