class CallbackController < ApplicationController
  def oauth
    code = params['code']
    client = MstdnIvory::Client.new(session[:instance_url])
    id, secret = InstanceRegister.client_info(session[:instance_url])
    client.get_access_token(id, secret, code, InstanceRegister.redirect_uri)
    id = client.get('/api/v1/accounts/verify_credentials').id
    session[:user_id] = id.to_i
    # /#/はvueがhashモードで動いているときに必要なもの
    # hisotryモードでは正常に動作しなかったので当面はこれ
    redirect_to '/#/memos'
  end
end
