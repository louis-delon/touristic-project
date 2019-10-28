Rails.application.routes.draw do

  devise_for :admins, skip: %i[sessions confirmations passwords]

  authenticate :admin do
    namespace :admins do
      root to: "dashboards#index"
      resources :sectors, only: %i(create show edit update delete)
      resources :sites, only: %i(create show edit update delete)
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
