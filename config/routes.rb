Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  namespace :admin do                 # if we want to route with a module and use that module's name as the URL prefix,
    resources :stats, only: [:index]  # we can use the namespace method instead of scope '/admin', module: 'admin' do
  end


  root 'posts#index'

end
