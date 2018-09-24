class MemosSerializer < ActiveModel::Serializer
  attributes :id, :status_id, :text, :url

  belongs_to :user, serializer: UsersSerializer

  has_many   :media, serializer: MediaSerializer
  has_many   :tags

  class TagSerializer < ActiveModel::Serializer
    attributes :name
  end
end
