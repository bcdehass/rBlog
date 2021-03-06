class Admin::PostsController < Admin::ApplicationController
  before_action :verify_logged_in #redirects to login page if someone tries to access admin side without credentials 

  def new
    @page_title = 'Add Post'
    @post = Post.new 
  end

  def create
    @post = Post.new(post_params)

    if params[:post][:image].blank? #if there is no image, set it to nil so it doesn't try to insert empty file
      @post.image = nil 
    end 

    if @post.save
      flash[:notice] = 'Post Created'
      redirect_to admin_posts_path
    else 
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if params[:post][:image].blank? #if there is no image, set it to nil so it doesn't try to insert empty file
          @post.image = nil 
    end

    if @post.update(post_params)
      flash[:notice] = 'Post Updated'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
     flash[:notice] = 'Post Deleted'
      redirect_to admin_posts_path
  end

  def index
    if params[:search]
      @posts = Post.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    else
      @posts = Post.all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page]) #sort by date create with the most recent first
    end
  end

  def show
  end

  private 
  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :image, :body)
  end
end
