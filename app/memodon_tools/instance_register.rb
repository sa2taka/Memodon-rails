require 'singleton'

# InstanceにAppを登録するclass
# client, secretを登録する
# client, secretを保存していない場合は取得して保存する
# 保存先は/etc/app_info
class InstanceRegister
  APP_NAME = 'memodon'.freeze
  REDIRECT_URI = if ENV['RACK_ENV'] == 'production'
    'https://memodon.com/callback/oauth'.freeze
  else
    'http://localhost:3000/callback/oauth'.freeze
  end
  class << self
    def register_app(instance_url)
      return if exist_info?(instance_url)
      id, secret = client_info(instance_url)
      title = instance_title(instance_url)
      save_client_info(url: instance_url, client_id: id, client_secret: secret, title: title)
    end

    def exist_info?(instance_url)
      Instance.exists?(url: instance_url)
    end

    def redirect_uri
      REDIRECT_URI
    end

    def client_info(instance_url)
      if exist_info?(instance_url)
        instance_info = Instance.find_by(url: instance_url)
        [instance_info.client_id, instance_info.client_secret]
      else
        client = MstdnIvory::Client.new(instance_url)
        res = client.create_app(APP_NAME, 'read', REDIRECT_URI)
        [res.client_id, res.client_secret]
      end
    end

    def instance_title(instance_url)
      if exist_info?(instance_url)
        instance_info = Instance.find_by(url: instance_url)
        instance_info.title
      else
        client = MstdnIvory::Client.new(instance_url)
        client.get('/api/v1/instance').title
      end
    end

    def save_client_info(instance_info)
      Instance.create(instance_info)
    end
  end
end
