Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  namespace :admin do
    resources :stats, only: [:index]
  end

  #namespace method makes the assumption that the path prefix and module name match

  root 'posts#index'
end
