class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: {maximum: 50}
  validates :prefecture, presence: true

  belongs_to :prefecture
  belongs_to :user

  has_many_attached :images
  has_many :comments, dependent: :destroy
  belongs_to :best_comment, foreign_key: :best_comment_id, class_name: 'Comment', optional: true 
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  acts_as_taggable
  is_impressionable counter_cache: true

  scope :sorted, -> { order(created_at: :desc) }
  scope :current_month, -> { where(created_at: Time.current.beginning_of_month..Time.current.end_of_month) }
  scope :last_month, -> { where('created_at < ?', Date.current.beginning_of_month)}
end
