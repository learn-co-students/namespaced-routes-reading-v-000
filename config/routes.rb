Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  #scope '/admin' module: 'admin' do
  #The namespace method makes the assumption that the path prefix and module name match, saving us some typing.
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
