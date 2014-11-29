class Post < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tag_list
  validates :title, presence: 'true'
  scope :post_filter, ->(tag){ tagged_with(tag) if tag.present? }
end
