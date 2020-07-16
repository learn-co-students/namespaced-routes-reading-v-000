Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'


namespace :admin do
  resources :stats, only: [:index]
  # resources :authors, only: [:new, :create]
  # get '/authors/delete', to: 'authors#delete'
  # get '/comments/moderate', to: 'comments#moderate'
end
  get '/admin/stats', to: 'stats#index'
  get '/admin/authors/new', to: 'authors#new'
  get '/admin/authors/delete', to: 'authors#delete'
  get '/admin/authors/create', to: 'authors#create'
  get '/admin/comments/moderate', to: 'comments#moderate'

  root 'posts#index'

end
