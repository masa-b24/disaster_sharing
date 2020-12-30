class StaticPagesController < ApplicationController
  def top
    @posts = Post.order('impressions_count DESC').take(6)
  end

  def guide
  end

  def home  
    @posts = Post.order('impressions_count DESC')
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present? 
    @posts = @posts.where('title LIKE :keyword OR content LIKE :keyword', keyword: "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @prefecture = Prefecture.find(params[:prefecture_id]) if params[:prefecture_id].present? 
  end

  def home_new
    @posts = Post.sorted
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present? 
    @posts = @posts.where('title LIKE :keyword OR content LIKE :keyword', keyword: "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @prefecture = Prefecture.find(params[:prefecture_id]) if params[:prefecture_id].present? 
  end

  def home_request
    @posts = Post.where(request_help: true)
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present? 
    @posts = @posts.where('title LIKE :keyword OR content LIKE :keyword', keyword: "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @prefecture = Prefecture.find(params[:prefecture_id]) if params[:prefecture_id].present? 
  end

  def ranking
    @ranking_likes = RankingLike.order(created_at: :desc).limit(47)
    @rasnkings = Ranking.order(created_at: :desc).limit(47)
  end
end
