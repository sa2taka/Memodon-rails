class LoginController < ApplicationController
  def index
  end

  def mastodon_login
    begin
      client_no_token = MstdnIvory::Client.new('https://mstdn-worker.com')
      instance = client_no_token.get('/api/v1/instance')
    rescue
      flash.now['red accent-2'] = '入力したインスタンスに接続できません'
      render 'index'
    end
  end
end
