class TagsWithTootSerializer < ActiveModel::Serializer
  attributes :name, :text, :count
end
