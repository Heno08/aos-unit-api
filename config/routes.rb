Rails.application.routes.draw do
  resources :units, only: [:new, :create, :index, :show] do
    resources :weapons, only: [:new, :create ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
