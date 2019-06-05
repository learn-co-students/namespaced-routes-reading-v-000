Rails.application.routes.draw do
  root 'posts#index'

  namespace :admin do
    resources :stats, only: %i[index]
  end

  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]


end
