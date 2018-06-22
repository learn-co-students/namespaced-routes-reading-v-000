Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  #we want only admins to access stats
  #get url to controller action:
  #get '/admin/stats', to: 'stats#index'
  #but what if we have a bunch of additional admin functions???

  #scope allows us to prefix a block or routes under one grouping
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  # However, we can make this a little drier. When we want to route with a module (the
  # admin module in controllers) and use that module's name as the URL prefix, we can use the
  # namespace method instead of scope, mode :
  namespace :admin do  #this is easier than writing: scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
  end


  root 'posts#index'
end
