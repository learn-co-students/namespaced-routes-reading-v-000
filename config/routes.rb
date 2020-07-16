Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

<<<<<<< HEAD
  namespace :admin do
=======
  scope '/admin' do
>>>>>>> 5185520c521c975936111c14e6d706f87517117c
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
