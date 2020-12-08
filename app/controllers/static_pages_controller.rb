class StaticPagesController < ApplicationController
  def top
  end

  def home
    if params[:search]
      @post = Post.where('content LIKE ?', "%#{params[:search]}%").sorted
    elsif params[:tag]
      @post = Post.tagged_with(params[:tag]).sorted
    else
      @post = Post.all.sorted
    # @tags = @post.tag_counts_on(:tags)
    end 
  end

end
