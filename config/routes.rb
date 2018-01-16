Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'
  namespace :admin do #the namespace method makes the assumption that the path prefix and module name match
    resources :stats, only: [:index] #using scope gave us a stats_path helper, namespace helper is prefixed with admin_ so stats_path becomes admin_stats_path
  end
end
