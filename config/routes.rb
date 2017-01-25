Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

# 1 one of accomplishing the task
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

# namespace combines the scope and module methods - assumes path prefix and module name match
# this creates different URL helpers than are made with scope
  namespace :admin do
    resources :stats, only: [:index]
  end
end
