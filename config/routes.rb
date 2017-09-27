Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end

  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]
  devise_for :users, controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
  }
  root 'topics#index'
  resources :topics do
    resources :comments
  end
  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end
