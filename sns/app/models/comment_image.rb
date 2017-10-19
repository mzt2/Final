class CommentImage < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  mount_uploader :image, CommentImageUploader

end
