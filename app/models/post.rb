class Post < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user

  has_many_attached :images

  # created_atカラムを降順で取得する
  scope :sorted, -> { order(created_at: :desc) }
  scope :current_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :last_month, -> { where(created_at: Time.now.prev_month.beginning_of_month..Time.now.prev_month.end_of_month) }
end
