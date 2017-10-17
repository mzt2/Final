class PostImage < ApplicationRecord
  belongs_to :post
  mount_uploader :post_image, ImageUploader

end
