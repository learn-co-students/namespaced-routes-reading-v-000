Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end
  # in proc aboe, we're telling scope that we want to use /admin as a URL prefix
  # and we're also letting Rails know that all of the included routes will be
  # handled by controllers in the 'admin' module (aka in controllers/admin directory)

  #Rails gives us a shortcut for 
  # scope 'admin', module: 'admin' and that is the namespace method.
  # the namespace method assums that the path prefix and module name match.

  namespace :admin do 
    resources :stats, only: [:index]
  end
end
