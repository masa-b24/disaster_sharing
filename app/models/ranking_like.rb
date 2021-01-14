class RankingLike < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user1, foreign_key: :user1_id, class_name: 'User', optional: true 
  belongs_to :user2, foreign_key: :user2_id, class_name: 'User', optional: true 
  belongs_to :user3, foreign_key: :user3_id, class_name: 'User', optional: true 
end
