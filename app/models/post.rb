class Post < ApplicationRecord
  belongs_to :prefecture
  belongs_to :user

  has_many_attached :images

  scope :sorted, -> { order(created_at: :desc) }
  scope :current_month, -> { where(created_at: Time.current.beginning_of_month..Time.current.end_of_month) }
  scope :last_month, -> { where('created_at < ?', Date.current.beginning_of_month)


}
end
