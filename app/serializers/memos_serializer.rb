class MemosSerializer < ActiveModel::Serializer
  attributes :id, :text, :url

  belongs_to :user, each_serializer: UsersSerializer

  has_many   :media, each_serializer: MediaSerializer
  has_many   :tags,  each_serializer: TagsSerializer
end
