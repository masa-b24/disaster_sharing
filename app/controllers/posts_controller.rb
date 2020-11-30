class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
  end

  def index
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to home_path, notice: "タスク「#{@post.title}」を作成されました。"
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :prefecture_id, :request_help, images: []) 
    end
end
