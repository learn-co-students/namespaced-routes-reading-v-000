Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

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
