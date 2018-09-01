Rails.application.routes.draw do
  get 'login', to: 'login#index'
  post 'login/mastodon_login'
  get 'callback/oauth'
  root to: 'app#index'
  namespace :api do
  end

  get '*path', to: redirect('/')
end
