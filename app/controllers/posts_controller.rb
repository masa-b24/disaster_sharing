class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @like = Like.new
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

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:success] = "タスク「#{post.title}」を削除しました。"
    redirect_back(fallback_location: root_path)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :prefecture_id, :request_help, :tag_list, images: []) 
    end
end
