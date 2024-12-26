Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "home", controller: "home", action: "index"
  post "home", controller: "home", action: "command"

  resources :boards, only: :show

  root "home#index"
end
