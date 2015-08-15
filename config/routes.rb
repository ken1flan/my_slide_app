Rails.application.routes.draw do
  root "top#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy", as: :signout
end
