Rails.application.routes.draw do
  
  root 'posts#index'

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  
  namespace :admin do # scope '/admin', module: 'admin' do
    resources :stats, only: [:index]             
  end
  
  # scope gives me access to stats_path
  # with namespace stats_path becomes admin_stats_path
  
  # get '/admin/stats', to: 'stats#index'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'
  
end
