Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

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
