Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

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
