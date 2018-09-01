class LoginController < ApplicationController
  def index
  end

  def mastodon_login
    flash.now[:danger] = '入力したインスタンスに接続できません'
  end
end
