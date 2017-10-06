Rails.application.routes.draw do

  namespace :admin do
    resources :stats, only: [:index]
  end

  # SAME AS ABOVE EXCEPT IT PREPENDS CONTROLLER NAME (eg. 'Stats') TO URL HELPER. EXAMPLE: 'stats_path' becomes 'admin_stats_path'
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'
end
