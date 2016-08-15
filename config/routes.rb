Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  namespace :admin do
    resources :stats, only: [:index]
    resources :authors, only: [:new, :delete, :create]
  end

# if you switch from scope to namespace, take care to update any URL helpers you have in use!

# We're telling scope that we want to use /admin as a URL prefix, and
# that all of the included routes will be handled by controllers in the admin
# module.

# scope '/admin', module: 'admin' do
# can be shortened to namespace :admin do

  get '/admin/comments/moderate', to: 'comments#moderate'

end
