class StaticPagesController < ApplicationController
  def top
  end

  def home
    @post = Post.all.sorted
    # @tags = @post.tag_counts_on(:tags)
  end
end
