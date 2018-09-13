class MediaSerializer < ActiveModel::Serializer
  attributes :id, :preview_url, :url, :media_type

  belongs_to :memo
end
