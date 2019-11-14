Rails.application.routes.draw do

  devise_for :admins

  authenticate :admin do
    namespace :admins do
      root to: "sectors#index"
      resources :sectors, only: %i(index create show edit update destroy) do
        collection do
          patch :sort, to: 'sorts#update'
        end
        resources :sites, only: %i(index create show edit update destroy) do
          collection do
            patch :sort, to: 'sorts#update'
          end
        end
      end
      resources :addresses, only: %i(index) do
        collection do
          patch :sort, to: 'sorts#update'
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
