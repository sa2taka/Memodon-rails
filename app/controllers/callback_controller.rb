class CallbackController < ApplicationController
  def oauth
    instance_url = session[:instance_url]
    account = save_id_to_session(params['code'], instance_url)
    user = create_user(account)

    # /#/はvueがhashモードで動いているときに必要なもの
    # hisotryモードでは正常に動作しなかったので当面はこれ
    if user.is_first
      user.update(is_first: false)
      redirect_to '/#/tutorial'
    else
      redirect_to '/#/memos'
    end

  end

  private

  def save_id_to_session(code, instance_url)
    client = MstdnIvory::Client.new(instance_url)
    id, secret = InstanceRegister.client_info(instance_url)
    client.get_access_token(id, secret, code, InstanceRegister.redirect_uri)
    account = client.get('/api/v1/accounts/verify_credentials')
    session[:user_id] = account.id.to_i
    account
  end

  def create_user(account)
    DBRegister.insert_account(account)
  end
end
