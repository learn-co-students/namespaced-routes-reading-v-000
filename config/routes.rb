Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # original
  # get '/admin/stats', to: 'stats#index'

  # scope version
  # scope allows for grouping of routes under a specified URL path. We have further grouped the controllers and views together under Admin, so we need to declare that module
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  # namespace version
  # namespacing can be used when want want to use the same name for both the module and the URL prefix
  # simplified declaration of routes, assumes path prefix and module name match
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
