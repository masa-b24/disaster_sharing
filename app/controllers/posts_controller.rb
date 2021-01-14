class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :create, :destroy]
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    p @post
    impressionist(@post, "some message", unique: [:session_hash])
    @comments = @post.comments.page(params[:page]).per(10)
    @like = Like.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to home_new_path(prefecture_id: @post.prefecture_id), notice: "タスク「#{@post.title}」を作成されました。"
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
    end
    flash[:success] = "タスク「#{@post.title}」を削除しました。"
    redirect_back(fallback_location: root_path)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :prefecture_id, :request_help, :tag_list, :best_comment_id, images: []) 
    end
end
