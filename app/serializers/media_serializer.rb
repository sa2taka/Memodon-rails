class MediaSerializer < ActiveModel::Serializer
  attributes :preview_url, :url, :media_type

  belongs_to :memo
end
