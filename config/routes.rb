Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  #get '/admin/stats', to: 'stats#index'

  #In routing, scope allows us to prefix a block of routes under one grouping. So let's change our stats route:

=begin
  scope '/admin' do 
    
    resources :stats, only: [:index]
  end

  root 'posts#index'
=end
 
  #Now we can reload /admin/stats, and it still works. Notice our new route is resourced. Now that we don't have to manually prefix /admin, we can go back to using resourced routes within the /admin scope.
  
  #Fortunately, Rails gives us a shortcut here. 
  #When we want to route with a module and use that module's name as the URL prefix, 
  #we can use the namespace method instead of scope, module.
=begin
  scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
  end
=end

namespace :admin do
  resources :stats, only: [:index]
end

end
