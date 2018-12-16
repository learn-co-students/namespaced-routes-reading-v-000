Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
  namespace :admin do
  #the above is the same as the below but allows for a route with a module that uses the module's name 
  #scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
