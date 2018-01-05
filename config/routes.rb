Rails.application.routes.draw do

  namespace :admin do # the URL path prefix "/admin" matches the name of the Admin module
    resources :stats, only: [:index]
  end
  # Above code is Rails shortcut for saying:
  #scope '/admin', module: 'admin' do
    #resources :stats, only: [:index]
  #end

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'
end
