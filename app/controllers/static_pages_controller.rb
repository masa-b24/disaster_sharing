class StaticPagesController < ApplicationController
  def top
    @posts = Post.order('impressions_count DESC').take(6)
  end

  def guide
  end

  def home 
    @posts = Post.order('impressions_count DESC').page(params[:page]).per(20)
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present? 
    @posts = @posts.where('title LIKE :keyword OR content LIKE :keyword', keyword: "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @prefecture = Prefecture.find(params[:prefecture_id]) if params[:prefecture_id].present? 
  end

  def home_new
    @posts = Post.sorted.page(params[:page]).per(20)
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present? 
    @posts = @posts.where('title LIKE :keyword OR content LIKE :keyword', keyword: "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @prefecture = Prefecture.find(params[:prefecture_id]) if params[:prefecture_id].present? 
  end

  def home_request
    @posts = Post.where(request_help: true).page(params[:page]).per(20)
    @posts = @posts.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present? 
    @posts = @posts.where('title LIKE :keyword OR content LIKE :keyword', keyword: "%#{params[:keyword]}%") if params[:keyword].present?
    @posts = @posts.tagged_with(params[:tag]) if params[:tag].present?
    @prefecture = Prefecture.find(params[:prefecture_id]) if params[:prefecture_id].present? 
  end

  def ranking_like
    @ranking_likes = RankingLike.last(47)
  end

  def ranking
    @rankings = Ranking.last(47)
  end
end
