class Api::TagsController < ApiController
  def index
    render json: user_tags, each_serializer: TagsWithTootSerializer
  end

  def recent
    render json: recent_tags, each_serializer: TagsSerializer
  end

  def most
    render json: most_tags, each_serializer: TagsWithNumSerializer
  end

  private

  def user_tags
    user_id = session[:user_id]
    search_user_tags(user_id)
  end

  def recent_tags
    user_id = session[:user_id]
    search_recent_tags(user_id)
  end

  def most_tags
    user_id = session[:user_id]
    search_most_tags(user_id)
  end

  def login_error
    LOGIN_ERROR
  end

  def search_user_tags(user_id)
    Tag
      .joins(:memos)
      .select('tags.name, memos.text')
      .where(['memos.user_id = ?', user_id])
      .group('tags.name, memos.text')
      .uniq(&:name)
  end

  def search_recent_tags(user_id)
    Memo
      .joins(:tags)
      .select('tags.*')
      .where(user_id: user_id)
      .order('memos.status_id desc')
      .uniq
      .take(Constants::DEFAULT_TAGS_SIZE)
  end

  def search_most_tags(user_id)
    Memo
      .joins(:tags)
      .select('tags.name, count(*) as count')
      .where(user_id: user_id)
      .group('tags.name')
      .order('count desc')
      .take(Constants::DEFAULT_TAGS_SIZE)
  end
end
