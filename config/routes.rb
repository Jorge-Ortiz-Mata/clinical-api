Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :appointments, only: %i[index create]
    resources :doctors, only: %i[index]
  end
end
