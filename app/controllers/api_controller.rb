class ApiController < ApplicationController
  before_action :require_login

  private

  def require_login
    flash['red accent-2'] = 'ログインしてください'
    render json: login_error if session[:user_id].nil?
  end

  def login_error
    Constants::LOGIN_ERROR
  end
end
