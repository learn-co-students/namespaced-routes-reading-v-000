Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  #scope '/admin', module: 'admin' do
  #namespace can be used when you want a route and module's name is same as URL prefix
  namespace :admin do 
   resources :stats, only: [:index]
  end

end
