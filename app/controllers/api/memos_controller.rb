class Api::MemosController < ApplicationController
  DEFAULT_PAGE_SIZE = 100
  def index
    render json: login_error if session[:user_id].nil?
    render json: search_user, each_serializer: MemosSerializer
  end

  private

  def search_user
    page    = params[:page] || 1
    size    = params[:size] || DEFAULT_PAGE_SIZE
    user_id = session[:user_id]
    user_memos(user_id, page, size)
  end

  def login_error
    { error: 'Invalid Login!!' }
  end

  def user_memos(user_id, page, size)
    User
      .find_by(user_id: user_id)
      .memos
      .page(page)
      .per(size)
      .order('memos.id desc')
  end
end
