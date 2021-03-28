Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # get '/admin/stats', to: 'stats#index'
  #
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

#new code widhout module
  # scope '/admin' do
  #  resources :stats, only: [:index]
  # end

#new code widh  module
# scope '/admin', module: 'admin' do
#  resources :stats, only: [:index]
# end

#When we want to route with a module and use that module's name as the URL prefix,
# we can use the namespace method instead of scope, module.

namespace :admin do
 resources :stats, only: [:index]
end





  root 'posts#index'
end
