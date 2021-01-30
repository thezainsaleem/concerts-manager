Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  default_url_options host: "localhost:3000"
  namespace :api, defaults: { format: :json } do
    namespace :v1  do
      resources :localities
      resources :artists
      resources :concerts
    end
  end
end
