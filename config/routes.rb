Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]
  # namespace to scope to the module admin
  namespace :admin do
    resources :stats, only: [:index]
  end
  # scope to module admin
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end
# scope to admin
  # scope '/admin' do 
  #   resources :stats, only: [:index]
  # end 
# route to admin
  # get '/admin/stats', to: 'stats#index'

  root 'posts#index'
end
