class Api::TagsController < ApiController
  def index
    render json: { user_tags: user_tags, recent_tags: recent_tags, most_tags: most_tags}
  end

  private

  def user_tags
    user_id = session[:user_id]

    ActiveModel::Serializer::CollectionSerializer.new(search_user_tags(user_id),
                                                      serializer: TagsSerializer,
                                                      scope: { user_id: session[:user_id] }
                                                     )
  end

  def recent_tags
    user_id = session[:user_id]

    ActiveModel::Serializer::CollectionSerializer.new(search_recent_tags(user_id),
                                                      serializer: TagsSerializer,
                                                      scope: { user_id: session[:user_id] }
                                                     )
  end

  def most_tags
    user_id = session[:user_id]

    ActiveModel::Serializer::CollectionSerializer.new(search_most_tags(user_id),
                                                      serializer: TagsSerializer,
                                                      scope: { user_id: session[:user_id] }
                                                     )
  end

  def login_error
    LOGIN_ERROR
  end

  def search_user_tags(user_id)
    Tag
      .joins(:memos)
      .select('tags.name')
      .where(['memos.user_id = ?', user_id])
      .group('tags.name')
  end

  def search_recent_tags(user_id)
    Tag
      .joins(:memos)
      .select('tags.name')
      .where(['memos.user_id = ?', user_id])
      .group('tags.name, memos.status_id')
      .order('memos.status_id desc')
      .uniq(&:name)
      .take(Constants::DEFAULT_TAGS_SIZE)
  end

  def search_most_tags(user_id)
    Tag
      .joins(:memos)
      .select('tags.name')
      .where(['memos.user_id = ?', user_id])
      .group('tags.name')
      .order('count(*) desc')
      .take(Constants::DEFAULT_TAGS_SIZE)
  end
end
