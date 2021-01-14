class User < ApplicationRecord
  validates :name, presence: true
  validates :prefecture, presence: true

  belongs_to :prefecture
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :lockable

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
