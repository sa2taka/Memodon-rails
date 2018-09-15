class Api::MemosController < ApplicationController
  def index
    render json: login_error if session[:user_id].nil?
    render json: create_memos, each_serializer: MemosSerializer
  end

  private

  def create_memos
    page     = params[:page] || 1
    size     = params[:size] || Constants::DEFAULT_PAGE_SIZE
    user_id  = session[:user_id]
    tag_name = params[:tag_name]
    return find_user_memos_with_tag(user_id, page, size, tag_name) unless tag_name.nil?
    find_user_memos(user_id, page, size)
  end

  def login_error
    LOGIN_ERROR
  end

  def find_user_memos(user_id, page, size)
    User
      .find(user_id)
      .memos
      .page(page)
      .per(size)
      .order('memos.status_id desc')
  end

  def find_user_memos_with_tag(user_id, page, size, tag_name)
    User
      .find(user_id)
      .memos
      .page(page)
      .per(size)
      .joins(:tags)
      .where(['tags.name = ?', tag_name])
      .order('memos.status_id desc')
  end
end
