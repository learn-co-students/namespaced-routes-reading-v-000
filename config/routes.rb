Rails.application.routes.draw do

  namespace :admin do
    # Scoping Routes
    #   Scope lets us hold a lot of routes under one grouping
    # Scoping with Modules
    #   We’ll make a controller to hold all of the admin features
    #   Updates views to reflect new admin controller
    #   Update routes to call module in admin controller
    # Namespace
    #   Changes URL helpers
    #   You’ll need to update helpers files to reflect this 
    resources :stats, only: [:index]
  end

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'
end
