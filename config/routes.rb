Rails.application.routes.draw do
  root to: 'app#index'

  get 'login', to: 'login#index', as: 'login'
  post 'logout', to: 'login#logout', as: 'logout'
  post 'login/mastodon_login'

  get 'callback/oauth'

  post 'memo/crawl'

  namespace :api do
    get 'memos', to: 'memos#index'
    get 'is_crawling', to: 'memos#is_crawling'
    get 'users', to: 'users#index'
    get 'current_user', to: 'users#current_user'
    get 'tags', to: 'tags#index'
  end

  get '*path', to: redirect('/')
end
