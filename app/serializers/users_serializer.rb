class UsersSerializer < ActiveModel::Serializer
  attributes :account_id, :username, :display

  has_many :memos
end
