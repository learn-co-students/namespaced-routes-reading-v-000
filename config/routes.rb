Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  namespace :admin do
    resources :stats, only: [:index]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/stats', to: 'stats#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/delete', to: 'authors#delete'
  get '/authors/create', to: 'authors#create'
  get '/comments/moderate', to: 'comments#moderate'

  root 'posts#index'
end
