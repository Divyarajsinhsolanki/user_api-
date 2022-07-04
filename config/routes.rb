Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions }

  end

  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'

    resources :users
    resources :posts
    resources :comments
    resources :votes
    resources :dislikes
    
end
