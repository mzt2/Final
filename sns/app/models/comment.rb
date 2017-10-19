class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comment_images, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  accepts_nested_attributes_for :comment_images, allow_destroy: true
  validates :comment, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  def like_user(user)
    CommentLike.find_by(user_id: user, comment_id: self.id)
  end
end
