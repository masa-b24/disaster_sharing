namespace :generate_ranking do
  desc 'ランキングの生成'
  task execute: :environment do
    posts = Post.where('best_comment_id IS NOT NULL')
    ranks = {}
    posts.each do |post|
      user = post.best_comment_id.user
      if ranks[user.id].blank?
        ranks[user.id] = 1
      else
        ranks[user.id] += 1
      end
    end
    ranks.sort_by { |_, v| v }.reverse.to_h

    puts ranks
  end
end
