Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  # scope '/admin', module: 'admin' do
  # NOTE : Replace "scope/module" with "namespace" when using both of the same
    # If moving from "scope" to "namespace" -> Need to remember to update all URL helpers
  namespace :admin do
    resources :stats, only: [:index]
  end


  root 'posts#index'
end
