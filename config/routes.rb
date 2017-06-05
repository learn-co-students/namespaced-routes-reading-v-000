Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  #scope prefixes the routes. eg. /admin/stats/index.html.erb
  #module indicates that the controller is nested under folder admin


  #scope '/admin', module: 'admin' do 
  #stats_path
  namespace :admin do
  #rouch changes to admin_stats_path
	  resources :stats, only: [:index]
	end
end
