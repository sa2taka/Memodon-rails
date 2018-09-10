class Api::UsersController < ApplicationController
  DEFAULT_PAGE_SIZE = 100
  def index
    render json: create_return_value
  end

  def current_user
    render json: User.find(session[:user_id])
  end

  private

  def create_return_value
    page    = params[:page] || 1
    size    = params[:size] || DEFAULT_PAGE_SIZE
    users(page, size)
  end

  def users(page, size)
    User.page(page).per(size)
  end
end
