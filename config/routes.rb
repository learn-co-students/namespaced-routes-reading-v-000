Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  # equivalent to this is below: get '/admin/stats', to: 'stats#index'
  # but with scope, you can nicely add additional routes
  # 'module' needed because using namespace (subfolders)
  #  scope '/admin', module: 'admin'do   ==> helper stats_path
  # namespace keyword is sort of shorthand for the scope/module  ==> helper admin_stats_path
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
