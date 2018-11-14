Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

# scope '/admin', module: 'admin' do
#   resources :stats, only: [:index]
# end
#  replaces
#  get '/admin/stats', to: 'stats#index'

# dry version
  namespace :admin do
    resources :stats, only [:index]
  end

  get '/admin/authors/new', to: 'authors#new'
  get '/admin/authors/delete', to: 'authors#delete'
  get '/admin/authors/create', to: 'authors#create'
  get '/admin/authors/moderate', to: 'authors#moderate'

  root 'posts#index'
end
