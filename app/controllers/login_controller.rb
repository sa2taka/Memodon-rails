class LoginController < ApplicationController
  def index
  end

  def mastodon_login
    flash.now['red accent-2'] = '入力したインスタンスに接続できません'
    render 'index'
  end
end
