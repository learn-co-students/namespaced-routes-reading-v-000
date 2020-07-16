Rails.application.routes.draw do

  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
