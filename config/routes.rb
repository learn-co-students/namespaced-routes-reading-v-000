Rails.application.routes.draw do

  # use namespace when routing with a module and using that module's name as the URL prefix
  namespace :admin do 
    resources :stats, only: [:index]
  end

  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  root 'posts#index'
end
