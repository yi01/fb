Rails.application.routes.draw do
  devise_for :users
  root 'topics#index'
  resources :topics
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
