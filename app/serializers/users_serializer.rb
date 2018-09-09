class UsersSerializer < ActiveModel::Serializer
  attributes :user_id, :username, :display

  has_many :memos
end
