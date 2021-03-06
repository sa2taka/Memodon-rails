class TagsSerializer < ActiveModel::Serializer
  attributes :name, :count, :text

  def count
    Tag
      .joins(:memos)
      .select('count(*) as count')
      .where(['memos.user_id = ? and tags.name = ?', user_id, name])
      .group('tags.name')
      .order(nil)
      .first
      .count
  end

  def text
    Tag
      .joins(:memos)
      .select('memos.text, memos.status_id')
      .where(['memos.user_id = ? and tags.name = ?', user_id, name])
      .group('memos.text, memos.status_id')
      .order(nil)
      .first
      .text
  end

  def user_id
    scope[:user_id]
  end

  def name
    object.name
  end
end
