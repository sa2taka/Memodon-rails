class TagsSerializer < ActiveModel::Serializer
  attributes :name

  belongs_to :memo
end
