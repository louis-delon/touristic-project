Rails.application.routes.draw do

  devise_for :admins

  authenticate :admin do
    namespace :admins do
      root to: "dashboards#index"
      resources :sectors, only: %i(create show edit update destroy)
      resources :sites, only: %i(create show edit update destroy)
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
