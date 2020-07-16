Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  namespace :admin do
  #^^^ same as: scope '/admin', module: 'admin' do when the names of URL and module folder are the same
    resources :stats, only: [:index]
  end


  root 'posts#index'
end
