Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end

  devise_for :users, controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]

  root 'topics#index'
  resources :topics do
    resources :comments
  end

end
