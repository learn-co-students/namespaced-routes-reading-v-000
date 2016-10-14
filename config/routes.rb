Rails.application.routes.draw do

  # get '/admin/stats', to: 'stats#index'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  # --In routing, scope allows us to prefix a block of routes under one grouping. So let's change our stats route:
  namespace '/admin', module: 'admin' do # --When we want to route with a module and use that module's name as the URL prefix, we can use the namespace method instead of scope, module.
    # --We're telling scope that we want to use /admin as a URL prefix, and we're also letting Rails know that all of the included routes will be handled by controllers in the admin module.
    resources :stats, only: [:index]
  end
end
