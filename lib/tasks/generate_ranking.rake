namespace :generate_ranking do
  desc 'いいねの総数ランキングの生成'
  task execute: :environment do
    posts = Post.all
    (1..47).to_a.each do |ids|
      ranks = {}
      post = posts.where(prefecture_id: ids)
      post.each do |post1|
        user = post1.user
        if ranks[user.id].blank?
          ranks[user.id] = post1.liked_users.count
        else
          ranks[user.id] += post1.liked_users.count
        end
      end
      puts sort_rank = ranks.sort.to_h
      ranking = RankingLike.new(
        year_month: Date.current.strftime('%Y年%m月'),
        user1_id: sort_rank.keys[0],
        user2_id: sort_rank.keys[1],
        user3_id: sort_rank.keys[2],
        prefecture_id: ids
      )
      ranking.save
    end
  end

  desc 'ベストコメントランキングの生成'
  task execute1: :environment do
    posts = Post.where('best_comment_id IS NOT NULL')
    (1..47).to_a.each do |ids| 
      ranks = {}
      post = posts.where(prefecture_id: ids)
      post.each do |post1|
        user = post1.best_comment.user
        if ranks[user.id].blank?
          ranks[user.id] = 1
        else
          ranks[user.id] += 1
        end
      end
      puts sort_rank = ranks.sort.to_h
      ranking = Ranking.new(
        year_month: Date.current.strftime('%Y年%m月'),
        user1_id: sort_rank.keys[0],
        user2_id: sort_rank.keys[1],
        user3_id: sort_rank.keys[2],
        prefecture_id: ids
      )
      ranking.save
    end
  end
end
