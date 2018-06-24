Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

#gives stats_path & stats_url
  # get '/admin/stats', to: 'stats#index'
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

#gives admin_stats_path & admin_stats_url
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
