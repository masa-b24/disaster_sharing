class StaticPagesController < ApplicationController
  def top
  end

  def home  
    @posts = Post.sorted
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present? 
    @posts = @posts.where('title LIKE :keyword OR content LIKE :keyword', keyword: "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
  end
end
