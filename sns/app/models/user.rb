class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :name, presence: true

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: :follower_id,
           dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: :followee_id,
           dependent: :destroy
  has_many :following, through: :active_relationships,
           source: :followee, dependent: :destroy
  has_many :followers, through: :passive_relationships,
           source: :follower, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_images, dependent: :destroy

  # def follow(followee)
  #   active_relationships.create(followee_id: followee.id)
  # end

  # def unfollow(followee)
  #   active_relationships.find_by(followee_id: followee.id).destroy
  # end

  def following?(followee)
    following.include?(followee)
  end

  def self.search(search)
    if search
      where (['name like ?', "%#{search}%"])
    else
      all
    end
  end


end
