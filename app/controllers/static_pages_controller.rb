class StaticPagesController < ApplicationController
  def top
  end

  def home
    @post  = Post.all.sorted
  end
end
