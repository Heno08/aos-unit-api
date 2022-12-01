Rails.application.routes.draw do
  get 'signup' => 'users#new'
  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
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
