Rails.application.routes.draw do
  root "top#index"
  get "/auth/:provider/callback", to: "sessions#create"
end
