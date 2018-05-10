namespace :admin do
  resources :stats, only: [:index]
end
