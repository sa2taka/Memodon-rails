class ApiController < ApplicationController
  before_action :require_login

  private

  def require_login
    if session[:user_id].nil?
      flash['red accent-2'] = 'ログインしてください'
      render json: login_error
    end
  end

  def login_error
    Constants::LOGIN_ERROR
  end
end
