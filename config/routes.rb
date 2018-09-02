Rails.application.routes.draw do
  root to: 'app#index'

  get 'login', to: 'login#index', as: 'login'
  post 'logout', to: 'login#logout', as: 'logout'
  post 'login/mastodon_login'

  get 'callback/oauth'

  namespace :api do
  end

  get '*path', to: redirect('/')
end
