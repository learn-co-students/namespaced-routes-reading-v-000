Rails.application.routes.draw do

  # using `namespace`
  namespace :admin do
    resources :stats, only: [:index]
  end

  # using `scope`
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'
end
