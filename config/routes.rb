Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-10-routes-and-resources/namespaced-routes
  # deleted code
  # get '/admin/stats', to: 'stats#index'

  #  #  # What we need is a way to group all these under /admin without typing /admin
  #  #  # all the time. That's where scope comes in.  In routing, scope allows us to
  #  #  # prefix a block of routes under one grouping. So let's change our stats route:
  #  #  # new code start
  #  #  scope '/admin' do
  #  #    resources :stats, only: [:index]
  #  #  end
  #  #  # new code end

  #  # we need to tell our routes about our new module.
  #  # new code start
  #  scope '/admin', module: 'admin' do
  #    resources :stats, only: [:index]
  #  end
  #  # new code end
  #  # We're telling scope that we want to use /admin as a URL prefix, and we're also
  #  # letting Rails know that all of the included routes will be handled by controllers
  #  # in the admin module. If we reload /admin/stats, everything should work just
  #  # like it did, but now we are logically organizing our controllers.

  # Right now, our route is scoped as scope '/admin', module: 'admin', which is
  # fine but perhaps a bit less DRY than we'd like.  Fortunately, Rails gives
  # us a shortcut here. When we want to route with a module and use that module's
  # name as the URL prefix, we can use the namespace method instead of scope, module.
  namespace :admin do
    resources :stats, only: [:index]
  end
  
  root 'posts#index'
end
