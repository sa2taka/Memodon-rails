class Api::MemosController < ApplicationController
  def index
    render json: login_error if session[:user_id].nil?
    render json: user_memos, each_serializer: MemosSerializer
  end

  private

  def user_memos
    page    = params[:page] || 1
    size    = params[:size] || Constants::DEFAULT_PAGE_SIZE
    user_id = session[:user_id]
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
end
