class MediaSerializer < ActiveModel::Serializer
  attributes :id, :preview_url, :url, :media_type
end
