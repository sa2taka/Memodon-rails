class Api::UsersController < ApplicationController
  def index
    render json: users
  end

  def current_user
    render json: User.find(session[:user_id])
  end

  private

  def users
    page    = params[:page] || 1
    size    = params[:size] || Constans::DEFAULT_PAGE_SIZE
    find_users(page, size)
  end

  def find_users(page, size)
    User.page(page).per(size)
  end
end
