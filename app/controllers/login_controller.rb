class LoginController < ApplicationController
  def index
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def mastodon_login
    begin
      url = "https://#{params[:instance_url]}"
      client = MstdnIvory::Client.new(url)
      client.get('/api/v1/instance')
      InstanceRegister.register_app(url)
      id, secret = InstanceRegister.client_info(url)
      login_url = client.create_authorization_url(id, secret, 'read', InstanceRegister.redirect_uri)

      session[:instance_url] = url
      redirect_to login_url
    rescue HTTP::ConnectionError => e
      flash.now['red accent-2'] = '入力したインスタンスに接続できません'
      render 'index'
    end
  end
end
