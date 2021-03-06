redis_params = { url: ENV['REDIS_URL'], namespace: 'sidekiq'}

Sidekiq.configure_server do |config|
  config.redis = redis_params
end

Sidekiq.configure_client do |config|
  config.redis = redis_params
end
