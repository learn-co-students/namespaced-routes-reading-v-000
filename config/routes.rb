Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  namespace :admin do
      get '/stats', to: 'stats#index'
  end

  root 'posts#index'
end
