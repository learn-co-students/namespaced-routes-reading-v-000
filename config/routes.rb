Rails.application.routes.draw do
  # get '/admin/stats', to: 'stats#index' route admin/stats to #diplay erb index.
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end
  #We can use namespace instead of scope and it assumes that the #path prefix and module name match
  namespace :admin do
    resources :stats, only: [:index]
  end
  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'
end
