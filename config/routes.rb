Rails.application.routes.draw do
  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, except: [:delete, :destroy]

  namespace :admin do
    resources :stats, only: :index
  end

  root 'posts#index'
end
