Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  get '/admin/comments/moderate', to: 'comments#moderate'

  namespace :admin do
    resources :stats, only: [:index]
    resources :authors, only: [:new, :delete, :create]
  end

  root 'posts#index'
end
