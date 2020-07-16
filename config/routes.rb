Rails.application.routes.draw do
    resources :posts, only: %i[show index new edit]
      
    namespace :admin do
      resources :stats, only: [:index]
    end
  end


  root 'posts#index'
end
