class Post < ActiveRecord::Base
  has_many :terms, :dependent => :destroy
  accepts_nested_attributes_for :terms, :allow_destroy => true, :reject_if => :all_blank
  validates :title, presence: 'true'
  scope :post_filter, ->(tag){ where(tag: tag) if tag.present? }
end
