Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  root 'posts#index'

  namespace :admin do  #shorthand version of - scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
  end
end
