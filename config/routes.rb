Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  # scope '/admin', module: 'admin' do
	 #  resources	:stats, only: [:index]
  #  end 

   namespace :admin do
   	 resources :stats, only: [:index]
   	end 

# the namespace method assumes that the prefix (admin)
# and the module name match -- 

  # get '/admin/stats', to: 'stats#index'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'
  # -> dried this out into scope admin, line 9 
  root 'posts#index'


end
