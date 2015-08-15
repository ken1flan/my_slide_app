Rails.application.routes.draw do
  resources :slides do
    resource :information, only: [:show], controller: "slides/information"
  end
  root "slides#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout
end
