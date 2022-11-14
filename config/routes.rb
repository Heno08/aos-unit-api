Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :weapons, only: [:index]
      resources :units do
        resources :weapons, except: [:index]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
