Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'

  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end
  # 
  # Code above can be rewritten using namespace technique like so:

  namespace :admin do
    resources :stats, only: [:index]
  end
end
