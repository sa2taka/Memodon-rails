class Api::TagsController < ApplicationController
  before_action :require_login

  def index
    render json: user_tags, each_serializer: TagsNumSerializer
  end

  def recent
    render json: recent_tags, each_serializer: TagsSerializer
  end

  def most
    render json: most_tags, each_serializer: TagsNumSerializer
  end

  private

  def require_login
    render json: login_error if session[:user_id].nil?
  end

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
    { error: 'Invalid Login!!' }
  end

  def search_user_tags(user_id)
    Memo
      .joins(:tags)
      .select('tags.name, count(*) as count')
      .where(user_id: user_id)
      .group('tags.name')
      .order('tags.name')
      .uniq
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
