class Post < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user

  has_many_attached :images

  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :desc) }
end
