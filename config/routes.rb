Rails.application.routes.draw do
  root to: 'app#index'
  namespace :api do
  end

  get '*path', to: redirect('/')
end
