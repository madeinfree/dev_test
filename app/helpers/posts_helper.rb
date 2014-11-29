module PostsHelper
  include ActsAsTaggableOn::TagsHelper
  def setup_term(term)
    post.build_term unless post.term
  end
end
