Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

# This...
  namespace :admin do
    resources :stats, only: [:index]
  end
  # is the same as this:
      # scope '/admin', module: 'admin' do
      #   resources :stats, only: [:index]
      # end
  # only more D.R.Y.
  # If you do this update any related URL helpers!
end
