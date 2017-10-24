Rails.application.routes.draw do

  scope '/admin', module: 'admin' do
#OR  namespace :admin do

# The namespace method makes the assumption
# that the path prefix and module name match, saving us some typing.

# Top-tip: There is one important difference between scope '/admin', module: 'admin' and namespace :admin,
# and it's in the URL helpers.
# Remember above that using scope gave us a stats_path helper.
# But now that we are using namespace, run rake routes again.
# You'll see that the helper is now prefixed with admin_,
# so stats_path becomes admin_stats_path.
# If you switch from scope to namespace, take care to update any URL helpers you have in use!

    resources :stats, only: [:index]
  end

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  root 'posts#index'
end
