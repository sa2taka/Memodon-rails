class Api::MemosController < ApplicationController
  DEFAULT_PAGE_SIZE = 100
  def index
    render json: create_return_value
  end

  private

  def create_return_value
    page    = params[:page] || 1
    size    = params[:size] || DEFAULT_PAGE_SIZE
    user_id = session[:user_id]
    return login_error if user_id.nil?
    user_memos(user_id, page, size)
  end

  def login_error
    { error: 'Invalid Login!!' }
  end

  def user_memos(user_id, page, size)
    User.find_by(user_id: user_id).memos.page(page).per(size)
  end
end
