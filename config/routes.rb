Rails.application.routes.draw do
  resources :zipcode, only: [:show]
end
