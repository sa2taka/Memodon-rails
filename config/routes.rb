Rails.application.routes.draw do
  get 'callback/oauth'
  root to: 'app#index'
  namespace :api do
  end

  get '*path', to: redirect('/')
end
