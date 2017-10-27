class Post < ApplicationRecord
  MAX_POST_IMAGES_LENGTH = 3

  belongs_to :user
  has_many :post_images, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  accepts_nested_attributes_for :post_images, allow_destroy: true
  validates :body, presence: true
  validates :user_id, presence: true
  validates :privacy, presence: true

  enum privacy: { share_with_all: 0, share_with_follower: 1, share_with_only_me: 2 }

  def liked_by(user)
    PostLike.find_by(user_id: user.id, post_id: self.id)
  end

  def image_urls
    post_images.map{|image| image.image_url}
  end

  def self.on_timeline(user)
    where(user_id: user.id).or(Post.where(user: user.following).share_with_all).or(Post.where(user: user.following).share_with_follower).includes(:user, :post_images)
  end

end
