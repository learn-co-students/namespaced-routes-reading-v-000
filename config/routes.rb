Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

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
