class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :privacy, :created_at, :image_urls

  belongs_to :user
end
