class Api::TagsController < ApplicationController
  def index
    render json: login_error if session[:user_id].nil?
    render json: user_tags, each_serializer: TagsSerializer
  end

  private

  def user_tags
    user_id = session[:user_id]
    search_user_tags(user_id)
  end

  def login_error
    { error: 'Invalid Login!!' }
  end

  def search_user_tags(user_id)
    Memo
      .joins(:tags)
      .select('tags.*')
      .where(user_id: user_id)
      .uniq
  end
end
