Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/admin/stats', to: 'stats#index'

  root 'posts#index'

  namespace :admin do
    resources :stats, only: [:index]
  end
  #instead of above you could write below
        #scope '/admin', module: 'admin' do
        #  resources :stats, only: [:index]
        #end
  #When we want to route with a module and use that module's name as the URL prefix, we can use the namespace method instead of scope, module.
  #Top-tip: There is one important difference between scope '/admin', module: 'admin' and namespace :admin, and it's in the URL helpers. Remember above that using scope gave us a stats_path helper. But now that we are using namespace, run rake routes again. You'll see that the helper is now prefixed with admin_, so stats_path becomes admin_stats_path. If you switch from scope to namespace, take care to update any URL helpers you have in use!



                  #when receiving the route 'stats', process a get request to the index action in the stats_controller
  get '/admin/authors/new', to: 'authors#new'
  get '/admin/authors/delete', to: 'authors#delete'
  get '/admin/authors/create', to: 'authors#create'
  get '/admin/comments/moderate', to: 'comments#moderate'
end
