Rails.application.routes.draw do
  devise_for :admins

  devise_for :admins, skip: %i[sessions confirmations passwords]

  authenticate :admin do
    namespace :admins do
    # root to:
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
