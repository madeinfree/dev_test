class Admin::PostsController < Admin::BaseController
  def index 
    @posts = Post.post_filter(params[:tag])
  end
  def new
    @post = Post.new
  end
  def create
    #railse post_params
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_url
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_posts_url
    else
     render :edit
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :terms)
  end
end 
