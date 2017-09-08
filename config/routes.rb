Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
  
  
  # get '/admin/stats', to: 'stats#index'
  
  #when stats_controller not in top of controllers folder do this:
  # scope '/admin' do
  #   resources :stats, only: [:index]
  # end
  
  #when stats_controller in the 'admin' subfolder of the controllers folder do this:
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  # Directly above is the same as this:
  namespace :admin do
    resources :stats, only: [:index]
  end
  
  root 'posts#index'
end
