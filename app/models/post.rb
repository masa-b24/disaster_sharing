class Post < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user

  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :desc) }
end
