class MemosSerializer < ActiveModel::Serializer
  attributes :id, :text, :url

  belongs_to :user, serializer: UsersSerializer

  has_many   :media, serializer: MediaSerializer
  has_many   :tags,  serializer: TagsSerializer
end
